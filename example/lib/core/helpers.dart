
import 'dart:async';
import 'dart:math';

class Helper {


  static List<int> randomData(int length,[ int? maxValue]) {
    return List.generate(length, (index) => Random().nextInt(maxValue ?? 1000));
  }


  static Timer periodic(void Function(Timer) callback, [int duration = 2]) {
    return Timer.periodic(Duration(seconds: duration), callback);
  }


}