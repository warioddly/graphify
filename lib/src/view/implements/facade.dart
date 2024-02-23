

import 'package:edarts/src/controller/interface.dart';
import 'package:edarts/src/view/interface.dart' as view;
import 'package:flutter/cupertino.dart';

class EdartView extends StatelessWidget implements view.EdartView {

  const EdartView({
    super.key,
    this.controller,
    this.options,
  });

  @override
  final EdartController? controller;

  @override
  final String? options;


  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }


}