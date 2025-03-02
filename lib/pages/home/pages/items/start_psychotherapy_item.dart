import 'package:flutter/cupertino.dart';
import 'package:pozitolk/core/extension/context_extension.dart';
import 'package:pozitolk/core/extension/num_extension.dart';

class StartPsychotherapyItem extends StatelessWidget {
  const StartPsychotherapyItem({super.key, required this.text, required this.image});
  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: .7.wp(context),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.5),
        color: context.color.background1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image,
            height: 200,
          ),
          10.hGap,
          Text(text, style: context.textStyle.s20w500inter,)
        ],
      ),
    );
  }
}





