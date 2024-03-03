import 'package:graphify/src/core/models/aria/g_aria_label.dart';
import 'package:graphify/src/core/models/interface.dart';


class GAria extends GraphifyModel {

  const GAria({
    this.enabled = false,
    this.label = const GAriaLabel(),
  });

  final bool enabled;
  final GAriaLabel label;

  GAria copyWith({
    bool? enabled,
    GAriaLabel? label,
  }) {
    return GAria(
      enabled: enabled ?? this.enabled,
      label: label ?? this.label,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'enabled': enabled,
      'label': label.toJson(),
    };
  }

}



