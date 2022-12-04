import 'package:flutter/material.dart';

abstract class AppColor {
  static MaterialColor materialColor = const MaterialColor(
    0xff416039,
    <int, Color>{
      50: Color(0x1a416039), //10%
      100: Color(0x33416039), //20%
      200: Color(0x4d416039), //30%
      300: Color(0x66416039), //40%
      400: Color(0x80416039), //50%
      500: Color(0x99416039), //60%
      600: Color(0xb3416039), //70%
      700: Color(0xcc416039), //80%
      800: Color(0xe6416039), //90%
      900: Color(0xff416039), //100%
    },
  );
}
