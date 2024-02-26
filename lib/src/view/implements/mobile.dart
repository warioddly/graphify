import 'package:graphify/src/core/mixins/state_mixin.dart';
import 'package:graphify/src/resources/index.html.dart';
import 'package:graphify/src/core/utils/utils.dart';
import 'package:graphify/src/view/interface.dart' as view_interface;
import 'package:graphify/src/controller/implements/mobile.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GraphifyView extends StatefulWidget implements view_interface.GraphifyView {

  const GraphifyView({
    super.key,
    this.controller,
    this.options,
  });

  @override
  final GraphifyController? controller;

  @override
  final String? options;


  @override
  State<StatefulWidget> createState() => _GraphifyViewMobile();


}

class _GraphifyViewMobile extends view_interface.GraphifyViewState<GraphifyView> with StateMixin {


  late WebViewController webViewController;
  late var controller = widget.controller;
  var identifier = '';


  @override
  void initView() {

    identifier = Utils.uid();

    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..loadHtmlString(indexHtml(id: identifier, options: widget.options))
      ..setOnConsoleMessage((message) {
        debugPrint("[+] onConsoleMessage ${message.message}");
      });

    controller
      ?..connector = webViewController
      ..identifier = identifier;

  }


  @override
  Widget buildView() {
    viewInitialized = true;
    return view = WebViewWidget(controller: webViewController);
  }


}