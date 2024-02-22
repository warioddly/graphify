import 'package:echarts/src/controller/interface.dart';
import 'package:flutter/cupertino.dart';

abstract class EchartView {

  const EchartView({
    this.controller
  });

  final EchartController? controller;

}


abstract class EchartViewBuilder {


  late Widget view;


  bool viewInitialized = false;


  Widget buildView();


  void initView();


}