import 'package:flutter/material.dart';

class ButlerHeading1 extends TextStyle {
  final Color? color;
  const ButlerHeading1({this.color}) : super(fontFamily: 'Butler', fontWeight: FontWeight.w500, fontSize: 36, color: color, height: 1.52);
}

class PoppinsBody1 extends TextStyle {
  final Color? color;
  const PoppinsBody1({this.color}) : super(fontFamily: 'Poppins', fontWeight: FontWeight.w300, fontSize: 14, color: color, height: 1.5);
}

class PoppinsButton extends TextStyle {
  final Color? color;
  const PoppinsButton({this.color}) : super(fontFamily: 'Poppins', fontWeight: FontWeight.w300, fontSize: 14, color: color, height: 1.5);
}
