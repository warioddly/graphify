
import 'package:flutter/material.dart';

import '../interface.dart' as controller_interface;


class EchartController implements controller_interface.EchartController {


  final ValueNotifier<bool> _ignoreAllGesturesNotifier = ValueNotifier(true);


  @override
  Future<void> chartUpdate(Map<String, dynamic> options) {
    // TODO: implement chartUpdate
    throw UnimplementedError();
  }


  void addIgnoreGesturesListener(void Function() cb) {
    _ignoreAllGesturesNotifier.addListener(cb);
  }


}