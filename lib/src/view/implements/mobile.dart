import 'package:echarts/src/controller/interface.dart';
import 'package:echarts/src/mixins/state_mixin.dart';
import 'package:echarts/src/resources/index.html.dart';
import 'package:echarts/src/view/interface.dart' as view_interface;
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EchartView extends StatefulWidget implements view_interface.EchartView {

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
  State<StatefulWidget> createState() => _EchartViewMobile();


}

class _EchartViewMobile extends view_interface.EchartViewState<EchartView> with StateMixin {


  late WebViewController controller;


  @override
  void initView() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..loadHtmlString(indexHtml())
      ..setOnConsoleMessage((message) {
        print("[+] onConsoleMessage ${message.message}");
      });
  }


  @override
  Widget buildView() {
    viewInitialized = true;
    return view = WebViewWidget(controller: controller);
  }


}