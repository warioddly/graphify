import 'package:graphify/src/shared/models/interface.dart';
import 'package:graphify/src/shared/models/styles/g_line_style.dart';

class GEmphasis extends GraphifyModel {

  const GEmphasis({
    this.scale = 1.1,
    this.disabled,
    this.focus = 'none',
    this.blurScope = 'coordinateSystem',
    this.lineStyle,
  });


  /// Whether to disable the emphasis state.
  ///
  /// When emphasis state is disabled. There will be no highlight effect when the mouse hovered the element, tooltip is triggered,
  /// or the legend is hovered. It can be used to improve interaction fluency when there are massive graphic elements.
  final bool? disabled;


  /// Whether to scale to highlight the data in emphasis state.
  ///
  /// number has been supported since v5.3.2, the default scale value is 1.1.
  final double scale;


  /// When the data is highlighted, whether to fade out of other data to focus the highlighted.
  ///
  /// The following configurations are supported:
  /// '[none]' Do not fade out other data, it's by default.
  /// '[self]' Only focus (not fade out) the element of the currently highlighted data.
  /// '[series]' Focus on all elements of the series which the currently highlighted data belongs to.
  final String focus;


  /// The range of fade out when focus is enabled.
  ///
  /// Support the following configurations
  /// '[coordinateSystem]'
  /// '[series]'
  /// '[global]'
  final String blurScope;


  /// The style of the item emphasis.
  ///
  /// Line color. Can set to '[inherit]' in the emphasis state to disable color highlight.
  final GLineStyle? lineStyle;



  GEmphasis copyWith() {
    return const GEmphasis(

    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
    };
  }

}