import 'package:flutter/material.dart';

// Basic Colors
const kPrimaryColor = Color(0xFF6F35A5);
const kPrimaryLightColor = Color(0xFFF1E6FF);
const KPrimaryGrayColor = Color(0xFFD9D9D9);

class Palette {
  static const Color iconColor = Color(0xFFB6C7D1);
  static const Color activeColor = Color(0xFF09126C);
  static const Color textColor1 = Color(0XFFA7BCC7);
  static const Color textColor2 = Color(0XFF9BB3C0);
  static const Color facebookColor = Color(0xFF3B5999);
  static const Color googleColor = Color(0xFFDE4B39);
  static const Color backgroundColor = Color(0xFFECF3F9);
}

// Gradients
final Shader linearGradient = LinearGradient(colors: [
  Color(0xffDA44bb),
  Color(0xff8921aa),
]).createShader(Rect.fromLTWH(0, 0, 200, 70));
