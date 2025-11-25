import 'dart:async';
import 'dart:convert';
import 'dart:js_interop';
import 'dart:js_interop_unsafe';

import 'package:graphify/src/controller/interface.dart' as controller_interface;
import 'package:graphify/src/controller/js_methods.dart';
import 'package:web/web.dart';

class GraphifyController extends controller_interface.GraphifyController {
  GraphifyController() {
    _messageListener = ((Event event) {
      try {
        final msgEvent = event as MessageEvent;
        final dataAny = msgEvent.data;
        if (dataAny is! String) {
          return;
        }
        final decoded = jsonDecode(dataAny as String);
        if (decoded is! Map<String, dynamic>) {
          return;
        }
        if (decoded['source'] != 'graphify') {
          return;
        }
        if (decoded['chartId'] != uid) {
          return;
        }

        final payloadString = decoded['payload'];
        if (payloadString is! String) {
          return;
        }
        final payloadDecoded = jsonDecode(payloadString);
        if (payloadDecoded is Map<String, dynamic>) {
          _clicks.add(payloadDecoded);
        }
      } catch (_) {}
    }).toJS as EventListener;
    window.addEventListener('message', _messageListener);
  }

  final StreamController<Map<String, dynamic>> _clicks =
      StreamController<Map<String, dynamic>>.broadcast();

  late final EventListener _messageListener;

  @override
  Stream<Map<String, dynamic>> get chartClickedEvent => _clicks.stream;

  @override
  void update(Map<String, dynamic>? options) {
    window.callMethod(
      JsMethods.updateChart.toJS,
      uid.toJS,
      jsonEncode(options ?? {}).toJS,
    );
  }

  @override
  void dispose() {
    try {
      window.removeEventListener('message', _messageListener);
    } catch (_) {}
    try {
      window.callMethod(JsMethods.disposeChart.toJS, uid.toJS);
    } catch (_) {}
    _clicks.close();
  }
}
