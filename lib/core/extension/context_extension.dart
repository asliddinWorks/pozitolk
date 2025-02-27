
import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_style.dart';

extension ContextExtension on BuildContext {

  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => theme.colorScheme; // get standard colors
  AppColors get color => theme.extension<AppColors>()!; // get custom colors

  TextTheme get textTheme => theme.textTheme; // get standard text styles
  AppTextStyle get textStyle => theme.extension<AppTextStyle>()!; // get custom text styles

  double get height => MediaQuery.of(this).size.height; // screen height
  double get width => MediaQuery.of(this).size.width; // screen width

  void get unFocus => FocusManager.instance.primaryFocus!.unfocus(); // close keyboard
}