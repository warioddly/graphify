

import 'package:echarts/src/controller/interface.dart';
import 'package:echarts/src/view/interface.dart' as view;
import 'package:flutter/cupertino.dart';

class EchartView extends StatelessWidget implements view.EchartView {

  const EchartView({
    super.key,
    this.controller
  });


  @override
  final EchartController? controller;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }


}