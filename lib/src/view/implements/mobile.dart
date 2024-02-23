import 'package:graphify/src/mixins/state_mixin.dart';
import 'package:graphify/src/resources/index.html.dart';
import 'package:graphify/src/view/interface.dart' as view_interface;
import 'package:graphify/src/controller/interface.dart' as controller_interface;
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GraphifyView extends StatefulWidget implements view_interface.GraphifyView {

  const GraphifyView({
    super.key,
    this.controller,
    this.options,
  });

  @override
  final controller_interface.GraphifyController? controller;

  @override
  final String? options;


  @override
  State<StatefulWidget> createState() => _GraphifyViewMobile();


}

class _GraphifyViewMobile extends view_interface.GraphifyViewState<GraphifyView> with StateMixin {


  late WebViewController controller;


  @override
  void initView() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..loadHtmlString(indexHtml())
      ..setOnConsoleMessage((message) {
        debugPrint("[+] onConsoleMessage ${message.message}");
      });
  }


  @override
  Widget buildView() {
    viewInitialized = true;
    return view = WebViewWidget(controller: controller);
  }


}