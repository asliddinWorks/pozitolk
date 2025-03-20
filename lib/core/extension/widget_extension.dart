
import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget padding(EdgeInsets padding) => Padding(
    padding: padding,
    child: this,
  );

  Widget get backgroundGradient => Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff273238),
            Color(0xff0E1116),
          ]
      ),
    ),
    child: this,
  );

  Widget loadingView(bool isLoading) {
    return Stack(
      children: [
        this,
        isLoading ?
        Container(
          color: Colors.black.withAlpha(200),
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ) : const SizedBox.shrink(),
      ],
    );
  }
}

extension WidgetListExtension on List<Widget> {
  List<Widget> paddingEach(EdgeInsets padding) => map((e) {
    return e.padding(padding);
  },).toList();
}
