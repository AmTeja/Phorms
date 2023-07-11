import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get cs => theme.colorScheme;
  Size get size => MediaQuery.of(this).size;
  double get width => size.width;
  double get height => size.height;
}
