import 'package:flutter/cupertino.dart';
import 'package:pozitolk/core/extension/num_extension.dart';
import 'package:pozitolk/core/extension/widget_extension.dart';
import 'package:pozitolk/pages/home/pages/items/convenience_item.dart';
import '../../../../constants/app_images.dart';

class ConvenienceUi extends StatelessWidget {
  const ConvenienceUi({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: ListView(
        scrollDirection:  Axis.horizontal,
        shrinkWrap: true,
        children: [
          15.wGap,
          ConvenienceItem(
            number: 1,
            padding: EdgeInsets.only(right: 15),
            title: 'Рекомендуем профессионалов в которых уверены',
            text: 'Вам не нужно беспокоиться о квалификации специалиста. Мы всё проверили.',
            image: AppImages.convenienceItem1,
          ),
          ConvenienceItem(
            number: 2,
            title: 'Гарантируем понятную фиксированную цену',
            text: 'У нас понятные цены за сессию, которые зависят от реального опыта  и квалификации специалистов',
          ),
          ConvenienceItem(
            number: 3,
            title: 'Помогаем найти именно «вашего» специалиста',
            text: 'Если психолог не подойдёт по любым причинам, мы предложим другого.',
          ),
          ConvenienceItem(
            number: 4,
            title: 'Делаем оплату сессий удобной и безопасной + оплата из любой точки Мира',
            text: 'Заботьтесь о себе без ограничений ',
            imageBottom: AppImages.convenienceItem4,
          ),
          ConvenienceItem(
            number: 5,
            title: 'Заботимся о результате',
            text: 'Напоминаем о сессиях, регулярно собираем отзывы и приходим на помощь, если что-то идёт не так.',
            image: AppImages.convenienceItem2,
          ),
          ConvenienceItem(
            padding: EdgeInsets.only(right: 15),
            number: 6,
            title: 'Бережём ваше время',
            text: 'Занимайтесь, где и когда вам удобно. Перенести или отменить сессию можно в личном кабинете в два клика.',
            image: AppImages.convenienceItem3,
          ),
          10.wGap
        ].paddingEach(EdgeInsets.only(right: 5)),
      ),
    );
  }
}
