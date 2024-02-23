import 'package:edarts/src/mixins/state_mixin.dart';
import 'package:edarts/src/resources/index.html.dart';
import 'package:edarts/src/view/interface.dart' as view_interface;
import 'package:edarts/src/controller/interface.dart' as controller_interface;
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EdartView extends StatefulWidget implements view_interface.EdartView {

  const EdartView({
    super.key,
    this.controller,
    this.options,
  });

  @override
  final controller_interface.EdartController? controller;

  @override
  final String? options;


  @override
  State<StatefulWidget> createState() => _EdartViewMobile();


}

class _EdartViewMobile extends view_interface.EdartViewState<EdartView> with StateMixin {


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