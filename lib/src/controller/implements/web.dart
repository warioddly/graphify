import 'dart:convert';
import 'dart:js_interop';
import 'dart:js_interop_unsafe';

import 'package:graphify/src/controller/interface.dart' as controller_interface;
import 'package:graphify/src/utils/js_methods.dart';
import 'package:graphify/src/utils/uid.dart';
import 'package:web/web.dart';

class GraphifyController implements controller_interface.GraphifyController {

  /// When create a new instance of [GraphifyController],
  /// it generates a new [uid] for the chart.
  GraphifyController() {
    uid = UID.generate();
  }


  /// The [WebViewController] that is used to interact with the chart.
  @override
  late final String uid;


  /// Updates the chart with the given [options].
  @override
  void update(Map<String, dynamic>? options) {
    window.callMethod(
      JsMethods.updateChart.toJS,
      uid.toJS,
      jsonEncode(options ?? {}).toJS,
    );
  }


  /// Disposes the chart.
  @override
  void dispose() {
    window.callMethod(JsMethods.disposeChart.toJS, uid.toJS);
  }
}
