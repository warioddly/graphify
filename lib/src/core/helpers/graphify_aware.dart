import 'package:flutter/material.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

class GraphifyAware extends StatelessWidget {

  /// Constructor
  const GraphifyAware({
    required this.child, Key? key,
    this.debug = false,
  }) : super(key: key);
  /// Child widget
  final Widget child;

  /// If set to true, a red box will appear around the widget
  final bool debug;

  @override
  Widget build(BuildContext context) {
    return PointerInterceptor(
      key: key,
      debug: debug,
      child: child,
    );
  }
}