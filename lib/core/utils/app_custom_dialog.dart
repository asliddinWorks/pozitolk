
import 'package:flutter/material.dart';

Future<bool?> appCustomDialog(BuildContext context, Widget widget,
    {double? paddingHorizontal, double? paddingVertical, double? radius}) async {
  return await showDialog<bool>(
    context: context,
    // barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: paddingHorizontal ?? 0, vertical: paddingVertical ?? 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 0),
        ),
        child: widget,
      );
    },
  );
}
