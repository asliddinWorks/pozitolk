import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pozitolk/constants/app_icons.dart';
import 'package:pozitolk/core/extension/context_extension.dart';
import 'package:pozitolk/core/extension/num_extension.dart';
import 'package:pozitolk/core/extension/widget_extension.dart';
import 'package:pozitolk/core/widgets/app_button.dart';
import 'package:pozitolk/pages/home/pages/widgets/advantages_ui.dart';
import 'package:pozitolk/pages/home/pages/widgets/collaborate_ui.dart';
import 'package:pozitolk/pages/home/pages/widgets/convenience_ui.dart';
import 'package:pozitolk/pages/home/pages/widgets/faqs_ui.dart';
import 'package:pozitolk/pages/home/pages/widgets/middle_home.dart';
import 'package:pozitolk/pages/home/pages/widgets/social_networks_ui.dart';
import 'package:pozitolk/pages/home/pages/widgets/start_psychotherapy.dart';
import 'package:pozitolk/pages/home/pages/widgets/to_help.dart';
import 'package:pozitolk/pages/home/pages/widgets/app_drawer.dart';
import 'package:pozitolk/pages/home/pages/widgets/start_home.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../constants/app_images.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      endDrawer: Drawer(
        backgroundColor: context.color.background1,
        width: context.width,
        child: SafeArea(
          child: AppDrawer(),
        ),
      ),
      backgroundColor: context.color.background1,
      appBar: AppBar(
        toolbarHeight: 56,
        automaticallyImplyLeading: false,
        backgroundColor: context.color.background1,
        actions: [
          IconButton(
            onPressed: () {
              _key.currentState!.openEndDrawer();
            },
            icon: Icon(
              Icons.menu,
              size: 24,
            ),
            padding: EdgeInsets.symmetric(horizontal: 20),
          ),
        ],
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            SvgPicture.asset(AppIcons.icLogo),
            5.wGap,
            Column(
              children: [
                2.hGap,
                Text('позитолк', style: context.textStyle.s16w400,),
                // Text('Психотерапия brbhr', style: GoogleFonts.leckerliOne(color: context.color.primary)),
              ],
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          StartHome(),
          130.hGap,
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              color: context.color.background2,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ToHelp(),
                40.hGap,
                Text(
                  'Преимущества позитивной и транскультуральной психотерапии',
                  style: context.textStyle.s24w400,
                ).padding(EdgeInsets.symmetric(horizontal: 20, vertical: 40)),
                AdvantagesUi(),
                60.hGap,
                Text(
                  'Работаем только с проверенными психологами',
                  style: context.textStyle.s24w400,
                ).padding(EdgeInsets.symmetric(horizontal: 20, vertical: 40)),
                CollaborateUi(),
                60.hGap,
                Text(
                  'ПозиТолк делает психотерапию удобной и доступной',
                  style: context.textStyle.s24w400,
                ).padding(EdgeInsets.symmetric(horizontal: 20, vertical: 40)),
                ConvenienceUi(),
                10.hGap,
                MiddleHome(),
                100.hGap,
                Text(
                  'как начать психотерапию',
                  style: context.textStyle.s24w400,
                ).padding(EdgeInsets.symmetric(horizontal: 20)),
                20.hGap,
                StartPsychotherapy(),
                100.hGap,
                Text(
                  'ответы на частые вопросы',
                  style: context.textStyle.s24w400,
                ).padding(EdgeInsets.symmetric(horizontal: 20)),
                FAQsUi(),
                100.hGap,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'остались вопросы?',
                      style: context.textStyle.s24w400,
                    ),
                    20.hGap,
                    Text(
                      'Свяжитесь с нами: \n+7 (989) 525-88-80 \n8 800 250 77 73',
                      style: context.textStyle.s16w500inter
                          .copyWith(color: context.color.textGrey2),
                    ),
                  ],
                ).padding(EdgeInsets.symmetric(horizontal: 20)),
                100.hGap,
                Text(
                  'наши соц.сети',
                  style: context.textStyle.s24w400,
                ).padding(EdgeInsets.symmetric(horizontal: 20)),
                30.hGap,
                SocialNetworksUi(),
                100.hGap,
                AspectRatio(
                  aspectRatio: 320 / 520,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            AppImages.findPsychologist,
                            fit: BoxFit.cover,
                            width: context.width,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Помогаем строить гармоничные отношения с собой и окружающими',
                              style: context.textStyle.s24w400,
                              textAlign: TextAlign.center,
                            ),
                            20.hGap,
                            AspectRatio(
                              aspectRatio: 280 / 45,
                              child: AppButton(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 30),
                                height: 45,
                                onPressed: () {},
                                text: 'Подобрать психолога',
                              ),
                            ),
                          ],
                        ).padding(EdgeInsets.symmetric(horizontal: 20)),
                      ],
                    ),
                  ),
                ),
                100.hGap,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'экстренная помощь',
                      style: context.textStyle.s24w400,
                    ),
                    20.hGap,
                    Text(
                      'Если вам требуется экстренная помощь + чат поддержки с психологами, в котором каждый зарегистрированный психолог может отвечать',
                      style: context.textStyle.s16w500inter.copyWith(
                        color: context.color.textGrey2,
                      ),
                    ),
                    20.hGap,
                    GestureDetector(
                      onTap: () {
                        launchUrlString("tel://+7 495 989-50-50");
                      },
                      child: Text(
                        '+7 495 989-50-50',
                        style: context.textStyle.s20w500inter.copyWith(
                          color: context.color.primary,
                        ),
                      ),
                    ),
                    8.hGap,
                    Text(
                      'Телефон горячей линии психологической помощи МЧС России',
                      style: context.textStyle.s16w500inter.copyWith(
                        color: context.color.textGrey2,
                      ),
                    ),
                    16.hGap,
                    GestureDetector(
                      onTap: () {
                        launchUrlString("tel://+7 499 173-09-09");
                      },
                      child: Text(
                        '+7 499 173-09-09',
                        style: context.textStyle.s20w500inter.copyWith(
                          color: context.color.primary,
                        ),
                      ),
                    ),
                    8.hGap,
                    Text(
                      'ТМосковская служба психологической помощи населению',
                      style: context.textStyle.s16w500inter.copyWith(
                        color: context.color.textGrey2,
                      ),
                    ),
                    16.hGap,
                    GestureDetector(
                      onTap: () {
                        launchUrlString("tel://+7 495 625-06-20");
                      },
                      child: Text(
                        '+7 495 625-06-20',
                        style: context.textStyle.s20w500inter.copyWith(
                          color: context.color.primary,
                        ),
                      ),
                    ),
                    8.hGap,
                    Text(
                      'Независимая психиатрическая ассоциация России',
                      style: context.textStyle.s16w500inter.copyWith(
                        color: context.color.textGrey2,
                      ),
                    ),
                    16.hGap,
                    GestureDetector(
                      onTap: () {
                        launchUrlString("tel://+7 800 200-01-22");
                      },
                      child: Text(
                        '+7 800 200-01-22',
                        style: context.textStyle.s20w500inter.copyWith(
                          color: context.color.primary,
                        ),
                      ),
                    ),
                    8.hGap,
                    Text(
                      'Детский телефон доверия МГППУ',
                      style: context.textStyle.s16w500inter.copyWith(
                        color: context.color.textGrey2,
                      ),
                    ),
                    16.hGap,
                  ],
                ).padding(EdgeInsets.symmetric(horizontal: 20)),
                90.hGap,
                Row(
                  children: [
                    SvgPicture.asset(AppIcons.icLogo),
                    5.wGap,
                    Text('позитолк', style: context.textStyle.s16w400),
                  ],
                ).padding(EdgeInsets.symmetric(horizontal: 20)),
                34.hGap,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: 0.41.wp(context),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Соц. сети',
                                style: context.textStyle.s20w500inter,
                              ),
                              16.hGap,
                              Text('Чат с ПозиТолк',
                                  style: context.textStyle.s16w400inter),
                              8.hGap,
                              Text('Instagram',
                                  style: context.textStyle.s16w400inter),
                              8.hGap,
                              Text('ВКонтакте',
                                  style: context.textStyle.s16w400inter),
                              8.hGap,
                              Text('Facebook',
                                  style: context.textStyle.s16w400inter),
                              8.hGap,
                              Text('Яндекс Дзен',
                                  style: context.textStyle.s16w400inter),
                              8.hGap,
                              Text('Тelegram',
                                  style: context.textStyle.s16w400inter),
                              8.hGap,
                            ],
                          ),
                        ),
                        10.hGap,
                        SizedBox(
                          width: 0.41.wp(context),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Другое',
                                style: context.textStyle.s20w500inter,
                              ),
                              16.hGap,
                              Text('Условия использования ',
                                  style: context.textStyle.s16w400inter),
                              8.hGap,
                              Text('Договор оказания услуг',
                                  style: context.textStyle.s16w400inter),
                              8.hGap,
                              Text('Правила акций',
                                  style: context.textStyle.s16w400inter),
                              8.hGap,
                              Text('Пользовательское соглашение',
                                  style: context.textStyle.s16w400inter),
                              8.hGap,
                            ],
                          ),
                        ),
                      ],
                    ),
                    10.wGap,
                    SizedBox(
                      width: 0.41.wp(context),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Навигация',
                            style: context.textStyle.s20w500inter,
                          ),
                          16.hGap,
                          Text('Для психологов',
                              style: context.textStyle.s16w400inter),
                          8.hGap,
                          Text('Для бизнеса',
                              style: context.textStyle.s16w400inter),
                          8.hGap,
                          Text('Тесты ', style: context.textStyle.s16w400inter),
                          8.hGap,
                          Text('База знаний',
                              style: context.textStyle.s16w400inter),
                          8.hGap,
                          Text('Подарок близким',
                              style: context.textStyle.s16w400inter),
                          8.hGap,
                        ],
                      ),
                    ),
                  ],
                ).padding(EdgeInsets.symmetric(horizontal: 20)),
                32.hGap,
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            'заходя на сайт, вы даёте согласие на использование файлов cookie и иных данных в соответствии c ',
                        style: context.textStyle.s16w400inter,
                      ),
                      TextSpan(
                          text: 'условиями использования',
                          style: context.textStyle.s16w400inter
                              .copyWith(decoration: TextDecoration.underline),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launchUrlString(
                                  'https://xn--g1acgdmcd1a.xn--p1ai/docs/pol-conf.pdf');
                            }),
                    ],
                  ),
                ).padding(EdgeInsets.symmetric(horizontal: 20)),
                8.hGap,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '© позитолк 2024',
                      style: context.textStyle.s16w400inter,
                    ),
                  ],
                ),
                100.hGap,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
