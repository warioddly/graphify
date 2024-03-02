import 'package:graphify/src/core/models/interface.dart';
import 'package:graphify/src/core/models/other/g_separator.dart';

class GAria extends GraphifyModel {

  const GAria({
    this.enabled = false,
    this.label = const GAriaLabel(),
  });

  final bool enabled;
  final GAriaLabel label;

  @override
  Map<String, dynamic> toJson() {
    return {
      'enabled': enabled,
      'label': label.toJson(),
    };
  }

}

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

class GAriaData extends GraphifyModel {

  const GAriaData({
    this.maxCount = 10,
    this.allData = 'whose data is --',
    this.partialData = 'where the first {displayCnt} term is --',
    this.withName = 'The data for {name} is {value}',
    this.withoutName = '{value}',
    this.separator = const GSeparator(middle: ',', end: ''),
  });

  final int maxCount;
  final String allData;
  final String partialData;
  final String withName;
  final String withoutName;
  final GSeparator separator;

  @override
  Map<String, dynamic> toJson() {
    return {
      'maxCount': maxCount,
      'allData': allData,
      'partialData': partialData,
      'withName': withName,
      'withoutName': withoutName,
      'separator': separator.toJson(),
    };
  }

}