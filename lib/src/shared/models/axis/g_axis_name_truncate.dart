
import 'package:graphify/src/shared/models/interface.dart';

class GAxisNameTruncate extends GraphifyModel {

  const GAxisNameTruncate({
    this.maxWidth = 80,
    this.ellipsis = '...',
    this.placeholder = '-',
  });

  /// The maximum length for the truncated text. Any text exceeding this length will be truncated.
  final int maxWidth;

  /// The content displayed at the end of the text after truncation.
  final String ellipsis;

  final String placeholder;


  GAxisNameTruncate copyWith({
    int? maxWidth,
    String? ellipsis,
    String? placeholder,
  }) {
    return GAxisNameTruncate(
      maxWidth: maxWidth ?? this.maxWidth,
      ellipsis: ellipsis ?? this.ellipsis,
      placeholder: placeholder ?? this.placeholder,
    );
  }


  @override
  Map<String, dynamic> toJson() {
    return {
      'maxWidth': maxWidth,
      'ellipsis': ellipsis,
      'placeholder': placeholder,
    };
  }

}