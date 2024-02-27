import 'package:flutter/material.dart' show Size;

enum ResponsibilityType {
  desktop,
  tablet,
  mobile
}


class Responsibility {

  factory Responsibility({
    double desktop = 1200,
    double tablet = 600,
    double mobile = 0
  }) {
    _instance
      .._desktop = desktop
      .._tablet = tablet;
    return _instance;
  }


  Responsibility._internal({
    double desktop = 1200,
    double tablet = 600,
  })
      : _desktop = desktop,
        _tablet = tablet;
        // _mobile = mobile;

  double _desktop = 1200;
  double _tablet = 600;
  // double _mobile = 0;


  static final _instance = Responsibility._internal();


  static ResponsibilityType getDevice(Size size) {

    final instance = Responsibility();

    if (size.width > instance._desktop) {
      return ResponsibilityType.desktop;
    } else if (size.width > instance._tablet) {
      return ResponsibilityType.tablet;
    } else {
      return ResponsibilityType.mobile;
    }
  }

}