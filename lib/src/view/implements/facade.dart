

import 'package:graphify/src/controller/interface.dart';
import 'package:graphify/src/view/interface.dart' as view;
import 'package:flutter/cupertino.dart';

class GraphifyView extends StatelessWidget implements view.GraphifyView {

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
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }


}