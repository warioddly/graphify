import 'dart:html';
import 'dart:ui_web';

import 'package:echarts/src/controller/interface.dart';
import 'package:echarts/src/mixins/state_mixin.dart';
import 'package:echarts/src/resources/index.html.dart';
import 'package:echarts/src/utils/utils.dart';
import 'package:echarts/src/view/interface.dart' as view_interface;
import 'package:flutter/cupertino.dart';

class EchartView extends StatefulWidget implements view_interface.EchartView {

  const EchartView({
    super.key,
    this.controller
  });

  @override
  final EchartController? controller;


  @override
  State<StatefulWidget> createState() => _EchartViewWeb();

}

class _EchartViewWeb extends State<EchartView> with StateMixin implements view_interface.EchartViewBuilder {


  IFrameElement iframe = IFrameElement();
  String viewType = '';


  @override
  late Widget view;


  @override
  bool viewInitialized = false;


  @override
  void initState() {
    super.initState();
    initView();
    buildView();
    Future.delayed(Duration.zero, appendContent);
  }


  @override
  Widget build(BuildContext context) => view;


  @override
  void initView() {
    registerView(viewType = Utils.uid());
  }


  @override
  Widget buildView() {
    viewInitialized = true;
    return view = HtmlElementView(viewType: viewType);
  }


  IFrameElement createIFrameElement() {
    iframe = IFrameElement()
      ..id = 'id_$viewType'
      ..name = 'name_$viewType'
      ..style.border = 'none';
    return iframe;
  }


  void registerView(String viewType) {

    if (viewType.isEmpty) {
      throw FlutterError("Unique viewType id is empty");
    }

    platformViewRegistry.registerViewFactory(viewType, (int viewId) => createIFrameElement());
  }


  void appendContent() {

    if (viewInitialized) {
      iframe.srcdoc = indexHtml;
    }
    else {
      throw FlutterError('View is not initialized');
    }

  }


}