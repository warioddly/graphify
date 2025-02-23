import 'package:flutter/cupertino.dart';
import 'package:graphify/src/controller/interface.dart';
import 'package:graphify/src/view/interface.dart' as g_view;

class GraphifyView extends StatelessWidget implements g_view.GraphifyView {
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
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
