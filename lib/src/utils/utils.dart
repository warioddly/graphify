

import 'dart:math';

class Utils {


  static String uid() {

    Random random = Random();

    String chars = 'abcdefghijklmnopqrstuvwxyz';
    String uid = '';

    for (int i = 0; i < 10; i++) {
      uid += chars[random.nextInt(chars.length)];
    }

    return uid;
  }



}