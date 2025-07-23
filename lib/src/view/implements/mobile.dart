import 'package:flutter/material.dart';
import 'package:graphify/src/controller/implements/mobile.dart';
import 'package:graphify/src/resources/dependencies.js.dart';
import 'package:graphify/src/resources/index.html.dart';
import 'package:graphify/src/view/_interface.dart' as g_view;
import 'package:webview_flutter/webview_flutter.dart';

class GraphifyView extends g_view.GraphifyView {
  const GraphifyView({
    super.key,
    super.controller,
    super.initialOptions,
    super.onConsoleMessage,
    super.onCreated,
  });

  @override
  State<StatefulWidget> createState() => _GraphifyViewState();
}

class _GraphifyViewState extends g_view.GraphifyViewState<GraphifyView> {

  late final webViewController = WebViewController();
  late final controller =
      (widget.controller ?? GraphifyController()) as GraphifyController;

  @override
  void initView() {
    controller.connector = webViewController
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setOnConsoleMessage(widget.onConsoleMessage ?? (_) {})
      ..loadHtmlString(
        indexHtml(
          id: controller.uid,
          dependencies: "<script>$dependencies</script>",
        ),
      )
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (_) {
            widget.onCreated?.call();
            controller.update(widget.initialOptions);
          },
        ),
      );
  }

  @override
  Widget buildView() {
    return view = WebViewWidget(controller: webViewController);
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      controller.dispose();
    }
    webViewController
      ..clearLocalStorage()
      ..clearCache();
    super.dispose();
  }
}
