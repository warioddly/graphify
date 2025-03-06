import 'dart:math';

/// This class is used to generate a unique identifier for each chart.
class UID {

  static String generate() {
    var random = Random();

    var chars = r'abcdefghijklmnopqrstuvwxyz123456789!@#$%^&*()_+';
    var uid = '';

    for (var i = 0; i < 10; i++) {
      uid += chars[random.nextInt(chars.length)];
    }

    return uid;
  }
}
