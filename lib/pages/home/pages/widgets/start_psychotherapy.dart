import 'package:flutter/cupertino.dart';
import 'package:pozitolk/core/extension/num_extension.dart';
import 'package:pozitolk/core/extension/widget_extension.dart';
import 'package:pozitolk/pages/home/pages/items/start_psychotherapy_item.dart';
import '../../../../constants/app_images.dart';

class StartPsychotherapy extends StatelessWidget {
  const StartPsychotherapy({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360,
      child: ListView(
        scrollDirection:  Axis.horizontal,
        shrinkWrap: true,
        children: [
          10.wGap,
          StartPsychotherapyItem(
            text: 'Пройдите быструю регистрацию',
            image: AppImages.startPsychotherapyItem1,
          ),
          StartPsychotherapyItem(
            text: 'Выберите психолога',
            image: AppImages.startPsychotherapyItem2,
          ),
          StartPsychotherapyItem(
            text: 'Начните психотерапию',
            image: AppImages.startPsychotherapyItem3,
          ),
          StartPsychotherapyItem(
            text: 'Назначайте сессии в удобное время',
            image: AppImages.startPsychotherapyItem4,
          ),
          1.wGap
        ].paddingEach(EdgeInsets.only(right: 10)),
      ),
    );
  }
}
