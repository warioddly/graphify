import 'package:graphify/src/models/aria/g_aria_data.dart';
import 'package:graphify/src/models/aria/g_aria_label_series.dart';
import 'package:graphify/src/models/interface.dart';

class GAriaLabel extends GraphifyModel {

  const GAriaLabel({
    this.enabled = false,
    this.description = '',
    this.withTitle = 'This is a chart about "{title}".',
    this.withoutTitle = 'This is a chart,',
    this.singleSeries = const GAriaLabelSeries(
      prefix: '',
      withName: ' with type {seriesType} named {seriesName}.',
      withoutName: ' with type {seriesType}.',
    ),
    this.multiSeries = const GAriaLabelSeries(),
  });

  final bool enabled;
  final String description;
  final String withTitle;
  final String withoutTitle;
  final GAriaLabelSeries singleSeries;
  final GAriaLabelSeries multiSeries;
  final GAriaData data = const GAriaData();


GAriaLabel copyWith({
    bool? enabled,
    String? description,
    String? withTitle,
    String? withoutTitle,
    GAriaLabelSeries? singleSeries,
    GAriaLabelSeries? multiSeries,
  }) {
    return GAriaLabel(
      enabled: enabled ?? this.enabled,
      description: description ?? this.description,
      withTitle: withTitle ?? this.withTitle,
      withoutTitle: withoutTitle ?? this.withoutTitle,
      singleSeries: singleSeries ?? this.singleSeries,
      multiSeries: multiSeries ?? this.multiSeries,
    );
  }


  @override
  Map<String, dynamic> toJson() {
    return {
      'enabled': enabled,
      'description': description,
      'general': {
        'withTitle': withTitle,
        'withoutTitle': withoutTitle,
      },
    };
  }

}
