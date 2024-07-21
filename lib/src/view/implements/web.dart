import 'dart:html';
import 'dart:ui_web';
import 'package:graphify/src/resources/dependencies.js.dart';
import 'package:graphify/src/resources/index.html.dart';
import 'package:graphify/src/core/utils/constants.dart';
import 'package:graphify/src/core/utils/utils.dart';
import 'package:graphify/src/view/interface.dart' as view_interface;
import 'package:flutter/cupertino.dart';
import 'package:graphify/src/controller/implements/web.dart';
import 'package:graphify/src/shared/models/g_model.dart';



class GraphifyView extends StatefulWidget implements view_interface.GraphifyView {

  const GraphifyView({
    super.key,
    this.controller,
    this.initialOptions,
  });

  @override
  final GraphifyController? controller;

  @override
  final GraphifyModel? initialOptions;


  @override
  State<StatefulWidget> createState() => _GraphifyViewWeb();

}

class _GraphifyViewWeb extends view_interface.GraphifyViewState<GraphifyView> {


  late final _controller = widget.controller ?? GraphifyController();
  late IFrameElement iframe;
  var identifier = '';

  @override
  void initView() {
    registerView(identifier = Utils.uid());
    _controller.identifier = identifier;

    initChartDependencies();

    Future.delayed(Duration.zero, initViewContent);

  }


  @override
  Widget buildView() {
    viewInitialized = true;
    return view = HtmlElementView(
      key: UniqueKey(),
      viewType: identifier,
    );
  }


  IFrameElement createIFrameElement() {
    iframe = IFrameElement()
      ..id = 'id_$identifier'
      ..name = 'name_$identifier'
      ..classes = ["graphify"]
      ..style.border = 'none';

    return iframe;
  }


  void registerView(String identifier) {

    if (identifier.isEmpty) {
      throw FlutterError("identifier is empty");
    }

    platformViewRegistry.registerViewFactory(identifier, (int viewId) => createIFrameElement());
  }


  void initViewContent() {

    if (viewInitialized) {

      iframe.srcdoc = indexHtml(
          id: identifier,
          enableDependency: false,
      );

      iframe.onLoad.listen((event) {
        _controller.update(widget.initialOptions);
      });

    }
    else {
      throw FlutterError('View is not initialized');
    }

  }


  void initChartDependencies() {

    final dependencyScript = window.document.querySelector("#$eChartDependencyId");

    if (dependencyScript == null) {
      final scriptElement = ScriptElement()
        ..id = eChartDependencyId
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