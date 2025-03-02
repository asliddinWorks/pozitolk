import 'package:flutter/cupertino.dart';
import 'package:pozitolk/core/extension/num_extension.dart';
import 'package:pozitolk/core/extension/widget_extension.dart';
import 'package:pozitolk/pages/home/pages/items/collaborate_item.dart';
import '../../../../constants/app_images.dart';

class CollaborateUi extends StatelessWidget {
  const CollaborateUi({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 470,
      child: ListView(
        scrollDirection:  Axis.horizontal,
        shrinkWrap: true,
        children: [
          10.wGap,
          CollaborateItem(
            title: 'Документы об образовании',
            text: 'Обязательно высшее психологическое образовании или диплом о переквалификации.',
            image: AppImages.collaborateItem1,
          ),
          CollaborateItem(
            title: 'Обучение в методе ',
            text: 'Позитивная и транскультуральная психотерапия, наличие европейского сертификата.',
            image: AppImages.collaborateItem2,
          ),
          CollaborateItem(
            title: 'Профессиональные и этические качества',
            text: 'Каждый специалист решает тест на этику и проходит собеседование по личностным ценностям.',
            image: AppImages.collaborateItem3,
          ),
          CollaborateItem(
            title: 'Опыт частной практики и личной терапии',
            text: 'Просим подтверждение, что специалист имеет опыт в работе психологом, проходит личную терапию и регулярные супервизии. ',
            image: AppImages.collaborateItem4,
          ),
          1.wGap
        ].paddingEach(EdgeInsets.only(right: 10)),
      ),
    );
  }
}
