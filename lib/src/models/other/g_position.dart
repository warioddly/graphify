import 'package:graphify/src/models/interface.dart';

class GPosition extends GraphifyModel {

  const GPosition({
    this.left = 'auto',
    this.bottom = 'auto',
    this.right = 'auto',
    this.top = 'auto',
  });


  /// Distance between title component and the left side of the container.
  ///
  /// [left] can be a pixel value like 20; it can also be a percentage value relative to container width like '20%'; and it can also be 'left', 'center', or 'right'.
  /// If the left value is set to be 'left', 'center', or 'right', then the component will be aligned automatically based on position.
  final dynamic left;


  /// Distance between title component and the top side of the container.
  ///
  /// [top] can be a pixel value like 20; it can also be a percentage value relative to container width like '20%'; and it can also be 'top', 'middle', or 'bottom'.
  /// If the top value is set to be 'top', 'middle', or 'bottom', then the component will be aligned automatically based on position.
  final dynamic top;


  /// Distance between title component and the right side of the container.
  ///
  /// [right] can be a pixel value like 20; it can also be a percentage value relative to container width like '20%'.
  /// Adaptive by default.
  final dynamic right;


  /// Distance between title component and the bottom side of the container.
  ///
  /// [bottom] can be a pixel value like 20; it can also be a percentage value relative to container width like '20%'.
  /// Adaptive by default.
  final dynamic bottom;


  GPosition copyWith({
    dynamic left,
    dynamic bottom,
    dynamic right,
    dynamic top,
  }) {
    return GPosition(
      left: left ?? this.left,
      bottom: bottom ?? this.bottom,
      right: right ?? this.right,
      top: top ?? this.top,
    );
  }


  @override
  Map<String, dynamic> toJson() {
    return {
      'left': left,
      'bottom': bottom,
      'right': right,
      'top': top,
    };
  }
}