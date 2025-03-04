import 'dart:js_interop';
import 'dart:ui_web';

import 'package:flutter/cupertino.dart';
import 'package:graphify/src/controller/implements/web.dart';
import 'package:graphify/src/resources/dependencies.js.dart';
import 'package:graphify/src/resources/index.html.dart';
import 'package:graphify/src/view/interface.dart' as g_view;
import 'package:web/web.dart';

const _chartDependencyId = 'graphify-chart-dependency';

class GraphifyView extends StatefulWidget implements g_view.GraphifyView {
  const GraphifyView({
    super.key,
    this.controller,
    this.initialOptions,
    this.onConsoleMessage,
    this.onCreated,
  });

  @override
  final GraphifyController? controller;

  @override
  final Map<String, dynamic>? initialOptions;

  @override
  final g_view.OnConsoleMessage? onConsoleMessage;

  @override
  final VoidCallback? onCreated;

  @override
  State<StatefulWidget> createState() => _GraphifyViewWeb();
}

class _GraphifyViewWeb extends g_view.GraphifyViewState<GraphifyView> {

  late final _controller = widget.controller ?? GraphifyController();

  String get _uid => _controller.uid;

  @override
  void initView() {
    initChartDependencies();
    platformViewRegistry.registerViewFactory(
      _uid,
      createHTMLIFrameElement,
    );
  }

  @override
  Widget buildView() {
    widget.onCreated?.call();
    return view = HtmlElementView(viewType: _uid);
  }

  HTMLIFrameElement createHTMLIFrameElement(_) {
    final iframe = HTMLIFrameElement()
      ..id = 'graphify_$_uid'
      ..style.width  = '100%'
      ..style.height = '100%'
      ..style.border = 'none'
      ..srcdoc = indexHtml(id: _uid).toJS
      ..onLoad.listen((_) => _controller.update(widget.initialOptions))
      ..onError.listen((event) {
        widget.onConsoleMessage?.call(event.toString());
      });

    return iframe;
  }

  void initChartDependencies() {
    final document = window.document;
    final dependencyScripts = document.querySelector("#$_chartDependencyId");

    if (dependencyScripts == null) {
      final scriptElement = HTMLScriptElement()
        ..id = _chartDependencyId
        ..innerHTML = dependencies.toJS;

      final dom = window.document;
      final body = dom.documentElement?.children.item(1);

      body?.append(scriptElement);
    }
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }
}
