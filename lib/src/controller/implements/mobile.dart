
import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:graphify/src/controller/interface.dart' as controller_interface;
import 'package:graphify/src/shared/enums/enums.dart';
import 'package:graphify/src/shared/models/charts/interface.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:graphify/src/shared/models/g_model.dart';


class GraphifyController implements controller_interface.GraphifyController {


  late final WebViewController _connector;


  @override
  String identifier = "";


  @override
  Future<void> update(GraphifyModel? options) async {

    if (identifier.isEmpty) {
      debugPrint("[+] identifier is empty");
      return;
    }

    await _eval('window.${GraphifyMethods.updateChart.name}("$identifier", ${jsonEncode(options?.toJson())})');

  }


  set connector(WebViewController connector) {
    _connector = connector;
  }


  Future<void> _eval(String js) async {
    if (js.isEmpty) {
      return;
    }
    await _connector.runJavaScript(js);
  }


  @override
  FutureOr<void> dispose() {
    if (identifier.isEmpty) {
      debugPrint("[+] identifier is empty");
      return null;
    }
    return _eval('window.${GraphifyMethods.disposeChart.name}("$identifier")');
  }


  @override
  Future<void> updateSeries(List<GChartModel> series) {
    // TODO: implement updateSeries
    throw UnimplementedError();
  }


}