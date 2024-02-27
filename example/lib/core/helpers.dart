
import 'dart:async';
import 'dart:math';

class Helper {


  List<int> randomData(int length,[ int? maxValue]) {
    return List.generate(length, (index) => Random().nextInt(maxValue ?? 1000));
  }


  Timer periodic(void Function(Timer) callback) {
    return Timer.periodic(const Duration(seconds: 2), callback);
  }


}