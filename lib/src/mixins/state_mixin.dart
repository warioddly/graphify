
import 'package:flutter/material.dart';



mixin StateMixin<T extends StatefulWidget> on State<T> {

  Size get size => MediaQuery.of(context).size;

  void updateState(VoidCallback fn) {
    if (mounted) {
      setState(fn);
    }
  }

}