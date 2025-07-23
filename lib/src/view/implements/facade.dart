import 'package:flutter/cupertino.dart';
import 'package:graphify/src/view/_interface.dart' as g_view;

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

  @override
  void initView() {
    throw UnimplementedError("initView() is not implemented");
  }

  @override
  Widget buildView() {
    throw UnimplementedError("buildView() is not implemented");
  }
}