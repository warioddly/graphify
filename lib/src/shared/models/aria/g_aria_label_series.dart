

import 'package:graphify/src/shared/models/interface.dart';
import 'package:graphify/src/shared/models/other/g_separator.dart';

class GAriaLabelSeries extends GraphifyModel {

  const GAriaLabelSeries({
    this.prefix = '. It consists of {seriesCount} series count.',
    this.withName = ' The {seriesId} series is a {seriesType} representing {seriesName}.',
    this.withoutName = ' The {seriesId} series is a {seriesType}.',
    this.separator = const GSeparator(middle: ';', end: '.'),
  });

  final String prefix;
  final String withName;
  final String withoutName;
  final GSeparator separator;

  GAriaLabelSeries copyWith({
    String? prefix,
    String? withName,
    String? withoutName,
    GSeparator? separator,
  }) {
    return GAriaLabelSeries(
      prefix: prefix ?? this.prefix,
      withName: withName ?? this.withName,
      withoutName: withoutName ?? this.withoutName,
      separator: separator ?? this.separator,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'prefix': prefix,
      'withName': withName,
      'withoutName': withoutName,
      'separator': separator.toJson(),
    };
  }

}
