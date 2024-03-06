import 'dart:convert';
import 'dart:js';
import 'package:flutter/foundation.dart' show debugPrint;
import 'package:graphify/src/controller/interface.dart' as controller_interface;
import 'package:graphify/src/core/enums/enums.dart';
import 'package:graphify/src/core/models/charts/interface.dart';
import 'package:graphify/src/core/models/g_model.dart';


class GraphifyController implements controller_interface.GraphifyController {


  @override
  String identifier = "";


  @override
  Future<void> update(GraphifyModel? options) async {

    if (identifier.isEmpty) {
      debugPrint("[+] identifier is empty");
      return;
    }

    context.callMethod(GraphifyMethods.updateChart.name, [identifier, jsonEncode(options?.toJson())]);

  }


  @override
  Future<void> dispose() async {

    if (identifier.isEmpty) {
      debugPrint("[+] identifier is empty");
      return;
    }

    context.callMethod(GraphifyMethods.disposeChart.name, [identifier]);

  }


  @override
  Future<void> updateSeries(List<GChartModel> series) async {

    if (identifier.isEmpty) {
      debugPrint("[+] identifier is empty");
      return;
    }

    context.callMethod(GraphifyMethods.updateChart.name, [
      identifier,
      jsonEncode({
        "series": series.map((e) => e.toJson()).toList(),
      })
    ]);

  }

}