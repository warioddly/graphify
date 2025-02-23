import 'dart:convert';
import 'dart:js';

import 'package:flutter/foundation.dart' show debugPrint;
import 'package:graphify/src/controller/interface.dart' as controller_interface;
import 'package:graphify/src/utils/js_methods.dart';
import 'package:graphify/src/utils/utils.dart';

class GraphifyController implements controller_interface.GraphifyController {
  GraphifyController() {
    uid = Utils.uid();
  }

  @override
  late String uid;

  @override
  Future<void> update(Map<String, dynamic>? options) async {
    if (uid.isEmpty) {
      debugPrint("[+] identifier is empty");
      return;
    }

    context.callMethod(JsMethods.updateChart, [uid, jsonEncode(options ?? {})]);
  }

  @override
  Future<void> dispose() async {
    if (uid.isEmpty) {
      debugPrint("[+] identifier is empty");
      return;
    }

    context.callMethod(JsMethods.disposeChart, [uid]);
  }
}
