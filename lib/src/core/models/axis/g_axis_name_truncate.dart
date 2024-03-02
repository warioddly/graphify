
import 'package:graphify/src/core/models/interface.dart';

class GAxisNameTruncate extends GraphifyModel {

  const GAxisNameTruncate({
    this.maxWidth = 80,
    this.ellipsis = '...',
    this.placeholder = '-',
  });

  final int maxWidth;
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