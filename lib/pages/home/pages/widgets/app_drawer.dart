
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pozitolk/core/extension/context_extension.dart';
import 'package:pozitolk/core/extension/num_extension.dart';
import 'package:pozitolk/core/extension/widget_extension.dart';
import 'package:pozitolk/router/router.dart';
import 'package:url_launcher/url_launcher_string.dart';
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
                    onTap: () {
                      launchUrlString('https://xn--g1acgdmcd1a.xn--p1ai/for-psycho');
                    },
                  ),
                  AppTextButton(
                    text: 'Для бизнеса',
                    onTap: () {
                    },
                  ),
                  AppTextButton(
                    text: 'Подарок близким',
                    onTap: () {
                      launchUrlString('https://xn--g1acgdmcd1a.xn--p1ai/gift');
                    },
                  ),
                  AppTextButton(
                    text: 'Тесты',
                    onTap: () {
                      launchUrlString('https://xn--g1acgdmcd1a.xn--p1ai/tests');
                    },
                  ),
                  AppTextButton(
                    text: 'База знаний',
                    onTap: () {
                      launchUrlString('https://xn--g1acgdmcd1a.xn--p1ai/blog');
                    },
                  ),
                  28.hGap,
                  AppTextButton(
                    text: 'Чат с позитолк',
                    onTap: () {
                      // launchUrlString('');
                    },
                  ),
                  AppTextButton(
                    text: 'Канал в Telegram',
                    onTap: () {
                      launchUrlString('https://t.me/pozi_tolk');
                    },
                  ),
                  AppTextButton(
                    text: 'Группа ВКонтакте',
                    onTap: () {
                      launchUrlString('https://vk.com/club226735405');
                    },

                  ),
                  AppTextButton(
                    text: 'Канал на YouTube',
                    onTap: () {
                      launchUrlString('https://www.youtube.com/@%D0%9F%D0%BE%D0%B7%D0%B8%D0%A2%D0%BE%D0%BB%D0%BA');
                    },
                  ),
                  AppTextButton(
                    text: 'Яндекс Дзен',
                    onTap: () {
                      launchUrlString('https://dzen.ru/pozi_tolk');
                    },
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
                    onPressed: () {
                      context.push(RouteNames.login);
                    },
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
