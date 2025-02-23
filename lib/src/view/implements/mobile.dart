import 'package:flutter/material.dart';
import 'package:graphify/src/controller/implements/mobile.dart';
import 'package:graphify/src/resources/index.html.dart';
import 'package:graphify/src/view/interface.dart' as g_view;
import 'package:webview_flutter/webview_flutter.dart';

class GraphifyView extends StatefulWidget implements g_view.GraphifyView {
  
  const GraphifyView({
    super.key,
    this.controller,
    this.initialOptions,
    this.onConsoleMessage,
  });

  @override
  final GraphifyController? controller;

  @override
  final Map<String, dynamic>? initialOptions;
  
  @override
  final g_view.OnConsoleMessage? onConsoleMessage;

  @override
  State<StatefulWidget> createState() => _GraphifyViewMobile();
}

class _GraphifyViewMobile extends g_view.GraphifyViewState<GraphifyView> {
  
  late WebViewController webViewController;
  late final _controller = widget.controller ?? GraphifyController();

  @override
  void initView() {
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..loadHtmlString(indexHtml(id: _controller.uid, enableDependency: true))
      ..setOnConsoleMessage((message) {
        debugPrint("Console: ${message.message}");
        widget.onConsoleMessage?.call(message.message);
      })
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (url) {
            _controller.update(widget.initialOptions);
          },
        ),
      );

    _controller.connector = webViewController;

  }

  @override
  Widget buildView() {
    return view = WebViewWidget(controller: webViewController);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
