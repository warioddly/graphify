import 'dart:html';
import 'dart:ui_web';
import 'package:graphify/src/mixins/state_mixin.dart';
import 'package:graphify/src/resources/dependencies.js.dart';
import 'package:graphify/src/resources/index.html.dart';
import 'package:graphify/src/utils/utils.dart';
import 'package:graphify/src/view/interface.dart' as view_interface;
import 'package:flutter/cupertino.dart';
import 'package:graphify/src/controller/implements/web.dart';



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
  State<StatefulWidget> createState() => _GraphifyViewWeb();

}

class _GraphifyViewWeb extends view_interface.GraphifyViewState<GraphifyView> with StateMixin {

  static const eChartDependencyId = 'e-chart-dependency';

  late var controller = widget.controller;
  var iframe = IFrameElement();
  var viewType = '';

  @override
  void initView() {
    registerView(viewType = Utils.uid());
    checkDependencyInDom();
    Future.delayed(Duration.zero, initViewContent);
  }


  @override
  Widget buildView() {
    viewInitialized = true;
    return view = HtmlElementView(
      key: UniqueKey(),
      viewType: viewType,
    );
  }


  IFrameElement createIFrameElement() {
    iframe = IFrameElement()
      ..id = 'id_$viewType'
      ..name = 'name_$viewType'
      ..classes = ["graphify"]
      ..style.border = 'none';
    return iframe;
  }


  void registerView(String viewType) {

    if (viewType.isEmpty) {
      throw FlutterError("Unique viewType id is empty");
    }

    platformViewRegistry.registerViewFactory(viewType, (int viewId) => createIFrameElement());
  }


  void initViewContent() {

    if (viewInitialized) {

      iframe.srcdoc = indexHtml(enableDependency: false);

      initConnector();

    }
    else {
      throw FlutterError('View is not initialized');
    }

  }


  void initConnector() {

    controller?.connector?.callMethod('setOptions', []);

  }



  void checkDependencyInDom() {

    final dom = window.document;
    final body = dom.documentElement?.children.last;
    final bodyChildren = body?.children.whereType<ScriptElement>().toList();

    if (bodyChildren == null || bodyChildren.isEmpty) {
      initChartDependencies();
    }
    else {

      for (var element in bodyChildren) {
        if (element.id == eChartDependencyId) {
          return;
        }
      }

      initChartDependencies();

    }

  }


  void initChartDependencies() {

    final scriptElement = ScriptElement()
        ..id = eChartDependencyId
        ..innerHtml = dependencies;

    final dom = window.document;
    final body = dom.documentElement?.children.last;

    body?.append(scriptElement);

  }


}