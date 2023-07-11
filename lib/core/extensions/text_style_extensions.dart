import 'package:flutter/material.dart';

extension TextStyleExtensions on TextStyle? {
  TextStyle? c(Color color) => this?.copyWith(color: color);
}
