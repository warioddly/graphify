import 'dart:math';

class UID {

  static const _chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  static final _secureRandom = Random.secure();

  static String generate([int length = 10]) {
    final buffer = StringBuffer();

    for (var i = 0; i < length; i++) {
      buffer.write(_chars[_secureRandom.nextInt(_chars.length)]);
    }

    return buffer.toString();
  }
}
