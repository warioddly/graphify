import 'package:graphify/src/core/models/interface.dart';
import 'package:graphify/src/core/models/other/g_separator.dart';

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

  GAriaData copyWith({
    int? maxCount,
    String? allData,
    String? partialData,
    String? withName,
    String? withoutName,
    GSeparator? separator,
  }) {
    return GAriaData(
      maxCount: maxCount ?? this.maxCount,
      allData: allData ?? this.allData,
      partialData: partialData ?? this.partialData,
      withName: withName ?? this.withName,
      withoutName: withoutName ?? this.withoutName,
      separator: separator ?? this.separator,
    );
  }

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
