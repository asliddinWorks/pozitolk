import 'package:flutter/cupertino.dart';
import 'package:pozitolk/core/extension/context_extension.dart';
import 'package:pozitolk/core/extension/num_extension.dart';
import 'package:pozitolk/core/extension/widget_extension.dart';

import '../../../../constants/app_images.dart';
import '../items/help_item.dart';

class ToHelp extends StatelessWidget {
  const ToHelp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        60.hGap,
        Text(
          'C чем помогают наши психологи',
          style: context.textStyle.s24w400,
        ),
        20.hGap,
        GridView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: .68,
          ),
          children: [
            HelpItem(
              text: 'Cправиться с тревогой, стрессом',
              image: AppImages.helpItem1,
            ),
            HelpItem(
              text: 'Депрессия, апатия',
              image: AppImages.helpItem2,
            ),
            HelpItem(
              text: 'Победить страх',
              image: AppImages.helpItem3,
            ),
            HelpItem(
              text: 'Психосоматика',
              image: AppImages.helpItem4,
            ),
            HelpItem(
              text: 'Принять себя и повысить самооценку',
              image: AppImages.helpItem5,
            ),
            HelpItem(
              text: 'Наладить отношения с детьми, партнером, коллегами',
              image: AppImages.helpItem6,
            ),
            HelpItem(
              text: 'РПП (расстройство пищевого поведения)',
              image: AppImages.helpItem7,
            ),
            HelpItem(
              text: 'Работа с горем',
              image: AppImages.helpItem8,
            ),
          ],
        ),
      ],
    ).padding(EdgeInsets.symmetric(horizontal: 20));
  }
}
