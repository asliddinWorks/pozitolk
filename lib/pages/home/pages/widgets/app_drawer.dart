
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pozitolk/core/extension/context_extension.dart';
import 'package:pozitolk/core/extension/num_extension.dart';
import 'package:pozitolk/core/extension/widget_extension.dart';
import '../../../../constants/app_icons.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_button.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(AppIcons.icLogo),
            5.wGap,
            Text('позитолк', style: context.textStyle.s16w400),
            Spacer(),
            IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Icon(Icons.close),
            ),
          ],
        ).padding(EdgeInsets.only(left: 16, top: 5, right: 3)),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  44.hGap,
                  AppTextButton(
                    text: 'Для психологов',
                    onTap: () {},
                  ),
                  AppTextButton(
                    text: 'Для бизнеса',
                    onTap: () {},
                  ),
                  AppTextButton(
                    text: 'Подарок близким',
                    onTap: () {},
                  ),
                  AppTextButton(
                    text: 'Тесты',
                    onTap: () {},
                  ),
                  AppTextButton(
                    text: 'База знаний',
                    onTap: () {},
                  ),
                  28.hGap,
                  AppTextButton(
                    text: 'Чат с позитолк',
                    onTap: () {},
                  ),
                  AppTextButton(
                    text: 'Канал в Telegram',
                    onTap: () {},
                  ),
                  AppTextButton(
                    text: 'Группа ВКонтакте',
                    onTap: () {},
                  ),
                  AppTextButton(
                    text: 'Канал на YouTube',
                    onTap: () {},
                  ),
                  AppTextButton(
                    text: 'Яндекс Дзен',
                    onTap: () {},
                  ),
                ],
              ),
              Column(
                children: [
                  AppButton(
                    contentPadding: EdgeInsets.symmetric(horizontal: 50),
                    appButtonType: AppButtonType.outlined,
                    height: 45,
                    width: double.infinity,
                    onPressed: () {},
                    text: 'Войти',
                  ),
                  6.hGap,
                  AppButton(
                    contentPadding: EdgeInsets.symmetric(horizontal: 50),
                    height: 45,
                    width: double.infinity,
                    onPressed: () {},
                    text: 'Подобрать психолога',
                  ),
                ],
              ),
            ].paddingEach(EdgeInsets.only(bottom: 4)),
          ).padding(
              EdgeInsets.only(left: 20, top: 5, bottom: 20, right: 20)),
        ),
      ],
    );
  }
}
