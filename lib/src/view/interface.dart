import 'package:graphify/src/controller/interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:graphify/src/core/models/interface.dart';

abstract class GraphifyView {

  GraphifyView({
    this.controller,
    this.initialOptions,
  });

  final GraphifyController? controller;

  final GraphifyModel? initialOptions;

}


abstract class GraphifyViewState<T extends StatefulWidget> extends State<T> {


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