import 'dart:convert';
import 'dart:js';
import 'package:flutter/foundation.dart' show debugPrint;
import 'package:graphify/src/controller/interface.dart' as controller_interface;
import 'package:graphify/src/core/enums/enums.dart';
import 'package:graphify/src/core/models/g_model.dart';

class GraphifyController implements controller_interface.GraphifyController {


  @override
  String identifier = "";


  @override
  Future<void> update(dynamic options) async {

    if (identifier.isEmpty) {
      debugPrint("[+] identifier is empty");
      return;
    }

    var _options = jsonEncode(const GraphifyModel().toJson());
    print(_options);

    if (options is GraphifyModel) {
      options = jsonEncode(options.toJson());
    }
    else if (options is Map) {
      options = jsonEncode(options);
    }
    else if (options is String) {
      options = options;
    }
    else {
      debugPrint("[+] options is not a valid type");
      return;
    }


    context.callMethod(GraphifyMethods.updateChart.name, [identifier, _options]);

  }


  @override
  Future<void> dispose() async {

    if (identifier.isEmpty) {
      debugPrint("[+] identifier is empty");
      return;
    }

    context.callMethod(GraphifyMethods.disposeChart.name, [identifier]);

  }

}