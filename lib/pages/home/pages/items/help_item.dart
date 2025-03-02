import 'package:flutter/cupertino.dart';
import 'package:pozitolk/core/extension/context_extension.dart';
import 'package:pozitolk/core/extension/num_extension.dart';

class HelpItem extends StatelessWidget {
  const HelpItem({super.key, required this.text, required this.image});
  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1.1,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 28),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.5),
              color: context.color.background1,
            ),
            child: Image.asset(image),
          ),
        ),
        12.hGap,
        Text(
          text,
          textAlign: TextAlign.center,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: context.textStyle.s14w400inter.copyWith(
            fontWeight: FontWeight.w500,
            color: context.color.textGrey2,
          ),
        )
      ],
    );
  }
}
