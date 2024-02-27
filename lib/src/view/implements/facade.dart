

import 'package:graphify/src/controller/interface.dart';
import 'package:graphify/src/view/interface.dart' as view;
import 'package:flutter/cupertino.dart';

class GraphifyView extends StatelessWidget implements view.GraphifyView {

  const GraphifyView({
    super.key,
    this.controller,
    this.initialOptions,
  });

  @override
  final GraphifyController? controller;

  @override
  final String? initialOptions;


  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }


}