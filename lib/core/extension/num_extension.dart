
import 'package:flutter/material.dart';

extension NumExtension on num {

  // Provide responsive size without fixed size
  double h(BuildContext context) => this / 1000 * MediaQuery.sizeOf(context).height;
  double w(BuildContext context) => this / 1000 * MediaQuery.sizeOf(context).width;

  // screen height and width percentage
  double hp(BuildContext context) => MediaQuery.sizeOf(context).height * this;
  double wp(BuildContext context) => MediaQuery.sizeOf(context).width * this;

  // To put space between two widgets
  Widget get hGap => SizedBox(height: this / 1);
  Widget get wGap => SizedBox(width: this / 1);

}