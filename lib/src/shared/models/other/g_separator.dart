
import 'package:graphify/src/shared/models/interface.dart';

class GSeparator extends GraphifyModel {

  const GSeparator({
    this.middle = '',
    this.end = '',
  });


  final String middle;
  final String end;

  @override
  Map<String, dynamic> toJson() {
    return {
      'middle': middle,
      'end': end,
    };
  }
}