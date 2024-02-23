import 'package:echarts/src/controller/interface.dart';
import 'package:flutter/cupertino.dart';

abstract class EchartView {

  EchartView({
    this.controller,
    this.options,
  }) : assert(controller == null && options == null, 'You must init one of controller or option');

  final EchartController? controller;

  final String? options;

}


abstract class EchartViewState<T extends StatefulWidget> extends State<T> {


  late Widget view;


  bool viewInitialized = false;


  Size get size => MediaQuery.of(context).size;


  @override
  void initState() {
    super.initState();
    initView();
    buildView();
  }


  @override
  Widget build(BuildContext context) => view;


  Widget buildView();


  void initView();


  void updateState(VoidCallback fn) {
    if (mounted) {
      setState(fn);
    }
  }


}