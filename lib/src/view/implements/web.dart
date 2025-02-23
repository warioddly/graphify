import 'dart:html';
import 'dart:ui_web';

import 'package:flutter/cupertino.dart';
import 'package:graphify/src/controller/implements/web.dart';
import 'package:graphify/src/resources/dependencies.js.dart';
import 'package:graphify/src/resources/index.html.dart';
import 'package:graphify/src/view/interface.dart' as g_view;

const _chartDependencyId = 'e-chart-dependency';

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
  State<StatefulWidget> createState() => _GraphifyViewWeb();
}

class _GraphifyViewWeb extends g_view.GraphifyViewState<GraphifyView> {
  late IFrameElement iframe;
  late final _controller = widget.controller ?? GraphifyController();

  @override
  void initView() {
    platformViewRegistry.registerViewFactory(
      _controller.uid,
      createIFrameElement,
    );

    initChartDependencies();

    Future.delayed(Duration.zero, initViewContent);
  }

  @override
  Widget buildView() {
    return view = HtmlElementView(
      key: UniqueKey(),
      viewType: _controller.uid,
    );
  }

  IFrameElement createIFrameElement(_) {
    iframe = IFrameElement()
      ..id = 'id_${_controller.uid}'
      ..name = 'name_${_controller.uid}'
      ..classes = ["graphify"]
      ..style.border = 'none';

    return iframe;
  }

  void initViewContent() {
    iframe
      ..srcdoc = indexHtml(
        id: _controller.uid,
        enableDependency: false,
      )
      ..onLoad.listen((event) {
        _controller.update(widget.initialOptions);
      })
      ..onError.listen((event) {
        widget.onConsoleMessage?.call(event.toString());
      });
  }

  void initChartDependencies() {
    final dependencyScript =
        window.document.querySelector("#$_chartDependencyId");

    if (dependencyScript == null) {
      final scriptElement = ScriptElement()
        ..id = _chartDependencyId
        ..innerHtml = dependencies;

      final dom = window.document;
      final body = dom.documentElement?.children.last;

      body?.append(scriptElement);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
