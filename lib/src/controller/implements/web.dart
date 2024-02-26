import 'dart:js';
import 'package:flutter/foundation.dart' show debugPrint;
import 'package:graphify/src/controller/interface.dart' as controller_interface;

class GraphifyController implements controller_interface.GraphifyController {


  @override
  String identifier = '';


  @override
  Future<void> update(String options) async {

    if (identifier.isEmpty) {
      debugPrint("[+] identifier is empty");
      return;
    }

    context.callMethod('updateChart', [identifier, options]);

  }



}