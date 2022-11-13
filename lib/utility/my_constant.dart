import 'package:flutter/material.dart';

class MyConstant {


  

  static Color bgColor = Colors.white;
  static Color dark = Colors.black;

  BoxDecoration curveBorder() => BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(15),
      );

  TextStyle h1Style() => const TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.bold,
      );

  TextStyle h2Style() => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
      );

  TextStyle h3Style() => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
      );

  TextStyle h3ActiveStyle() => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.purple,
      );
}
