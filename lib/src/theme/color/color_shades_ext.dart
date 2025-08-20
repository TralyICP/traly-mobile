import 'package:flutter/material.dart';

/// Defines color shades for easy access
extension ColorShades on MaterialColor {
  Color get p50 => this[50]!;
  Color get p100 => this[100]!;
  Color get p200 => this[200]!;
  Color get p300 => this[300]!;
  Color get p400 => this[400]!;
  Color get p500 => this[500]!;
  Color get p600 => this[600]!;
  Color get p700 => this[700]!;
  Color get p800 => this[800]!;
  Color get p900 => this[900]!;
}
