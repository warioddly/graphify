

import 'package:echarts/src/controller/interface.dart';
import 'package:echarts/src/view/interface.dart' as view;
import 'package:flutter/cupertino.dart';

class EchartView extends StatelessWidget implements view.EchartView {

  const EchartView({
    super.key,
    this.controller,
    this.options,
  });

  @override
  final EchartController? controller;

  @override
  final String? options;


  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }


}