import 'dart:html';
import 'dart:ui_web';
import 'package:echarts/src/mixins/state_mixin.dart';
import 'package:echarts/src/resources/dependencies.js.dart';
import 'package:echarts/src/resources/index.html.dart';
import 'package:echarts/src/utils/utils.dart';
import 'package:echarts/src/view/interface.dart' as view_interface;
import 'package:echarts/src/controller/interface.dart' as controller_interface;
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:flutter/cupertino.dart';



class EchartView extends StatefulWidget implements view_interface.EchartView {

  const EchartView({
    super.key,
    this.controller,
    this.options,
  });

  @override
  final controller_interface.EchartController? controller;

  @override
  final String? options;


  @override
  State<StatefulWidget> createState() => _EchartViewWeb();

}

class _EchartViewWeb extends view_interface.EchartViewState<EchartView> with StateMixin {


  late final controller = widget.controller;
  IFrameElement iframe = IFrameElement();
  String viewType = '';
  static const eChartDependencyId = 'e-chart-dependency';

  @override
  void initView() {
    registerView(viewType = Utils.uid());
    checkDependencyInDom();
    Future.delayed(Duration.zero, initViewContent);
  }


  @override
  Widget buildView() {
    viewInitialized = true;
    return view = Stack(
      alignment: AlignmentDirectional.center,
      children: [

        SizedBox.square(
          child: HtmlElementView(
              key: UniqueKey(),
              viewType: viewType,
          ),
        ),

        PointerInterceptor(
          debug: true, // optional
          child: const SizedBox(
            width: 250,
            height: 500,
            // A sized box is enough, but this Widget normally is a "button" or
            // something that needs to be clickable in Flutter.
          ),
        ),

      ],
    );
  }


  IFrameElement createIFrameElement() {
    iframe = IFrameElement()
      ..id = 'id_$viewType'
      ..name = 'name_$viewType'
      ..classes = ["echarts"]
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

    }
    else {
      throw FlutterError('View is not initialized');
    }

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