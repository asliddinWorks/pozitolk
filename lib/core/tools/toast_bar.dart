import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '/core/extension/context_extension.dart';

showToast(BuildContext context, String msg, {int? duration, int? gravity}) {
  context.unFocus; // close the keyboard
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 3,
    backgroundColor: context.color.inactiveFBA,
    textColor: context.color.text,
    fontSize: 16.0,
  );
}
