import 'package:graphify/src/models/interface.dart';
import 'package:graphify/src/models/styles/g_text_style.dart';

class GAxisData extends GraphifyModel {

  const GAxisData({
    required this.value,
    this.textStyle = const GTextStyle(),
  });

  /// Name of a category.
  final String value;

  /// The text style of [value].
  final GTextStyle textStyle;


  @override
  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'textStyle': textStyle.toJson(),
    };
  }

}