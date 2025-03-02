import 'package:flutter/cupertino.dart';
import 'package:pozitolk/core/extension/context_extension.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton(
      {super.key, required this.text, required this.onTap, this.style});
  final String text;
  final void Function() onTap;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: style ?? context.textStyle.s20w400inter,
      ),
    );
  }
}
