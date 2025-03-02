import 'package:flutter/cupertino.dart';
import 'package:pozitolk/core/extension/context_extension.dart';

class ContainerWithText extends StatelessWidget {
  const ContainerWithText({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 4),
      decoration: BoxDecoration(
        color: context.color.containerBackground,
        borderRadius: BorderRadius.circular(55),
      ),
      // height: 28,
      child: Text(text, style: context.textStyle.s16w500inter.copyWith(color: context.color.textGrey, height: 0),),
    );
  }
}
