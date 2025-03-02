import 'package:flutter/cupertino.dart';
import 'package:pozitolk/core/extension/num_extension.dart';
import 'package:pozitolk/core/extension/widget_extension.dart';

import '../../../../constants/app_images.dart';
import '../items/advantages_item.dart';

class AdvantagesUi extends StatelessWidget {
  const AdvantagesUi({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 390,
      child: ListView(
        scrollDirection:  Axis.horizontal,
        shrinkWrap: true,
        children: [
          10.wGap,
          AdvantagesItem(
            text: 'Позитивная и Транскультуральная Психотерапия (ППТ) научно-доказанный метод',
            image: AppImages.advantagesItem1,
          ),
          AdvantagesItem(
            text: 'Возможность краткосрочной помощи 10-15 сессий',
            image: AppImages.advantagesItem2,
          ),
          AdvantagesItem(
            text: 'Психологи с высшим образованием и европейским сертификатом',
            image: AppImages.advantagesItem3,
          ),
          AdvantagesItem(
            text: 'Наши специалисты работают с любыми запросами',
            image: AppImages.advantagesItem4,
          ),
          AdvantagesItem(
            text: 'Позитивная и транскультуральная психотерапия — это метод, когда клиент в процессе терапии опирается на собственные ресурсы, а психолог помогает их найти',
            image: AppImages.advantagesItem5,
          ),
          AdvantagesItem(
            text: 'ППТ про реальность, уникальную реальность каждого из нас, неповторимую, сложную. Про веру в то, что каждый человек способен справляться с трудностями на своём пути. Про то, что в жизни есть все: радость и печаль, вдохновение и разочарование, любовь и ненависти и многое другое',
            image: AppImages.advantagesItem6,
          ),
          AdvantagesItem(
            text: 'Позитивная и транскультуральная психотерапия — очень бережный метод, когда психолог смотрит на мир глазами клиента и через призму его ценностей',
            image: AppImages.advantagesItem7,
          ),
          1.wGap
        ].paddingEach(EdgeInsets.only(right: 10)),
      ),
    );
  }
}
