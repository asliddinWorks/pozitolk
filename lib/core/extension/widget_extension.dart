
import 'package:flutter/material.dart';

extension WidgetExtension on Widget {

  // padding for single widget
  Widget padding(EdgeInsets padding) => Padding(
    padding: padding,
    child: this,
  );

}

extension WidgetListExtension on List<Widget> {

  // padding for each widget in the list
  List<Widget> paddingEach(EdgeInsets padding) => map((e) {
    return e.padding(padding);
  },).toList();

}
