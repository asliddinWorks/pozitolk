import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pozitolk/constants/app_images.dart';
import 'package:pozitolk/core/extension/context_extension.dart';
import 'package:pozitolk/core/extension/num_extension.dart';
import 'package:pozitolk/core/extension/widget_extension.dart';
import 'package:provider/provider.dart';

import '../../../../constants/app_icons.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../router/router.dart';
import '../../view_model/home_view_model.dart';
import '../items/container_with_text.dart';

class StartHome extends StatelessWidget {
  const StartHome({super.key});

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<HomeViewModel>();
    final read = context.read<HomeViewModel>();
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        SizedBox(
          height: 160,
          width: 150,
          child: Image.asset(AppImages.backgroundLogo),
        ).padding(EdgeInsets.only(top: 25)),
        Column(
          children: [
            FittedBox(
              child: Column(
                children: [
                  24.hGap,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ContainerWithText(text: 'поддержка'),
                      10.wGap,
                      ContainerWithText(text: 'помощь в чате 24/7'),
                    ],
                  ),
                  10.hGap,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ContainerWithText(text: 'принятие'),
                      10.wGap,
                      ContainerWithText(text: 'быть услышанным'),
                    ],
                  ),
                  10.hGap,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ContainerWithText(text: 'новый опыт'),
                      10.wGap,
                      ContainerWithText(text: 'опора'),
                    ],
                  ),
                ],
              ).padding(EdgeInsets.symmetric(horizontal: 18)),
            ),
            Column(
              children: [
                60.hGap,
                FittedBox(
                  child: Text(
                    maxLines: 2,
                    'Поможем найти \n психолога',
                    style: context.textStyle.s32w400,
                    textAlign: TextAlign.center,
                  ).padding(EdgeInsets.symmetric(horizontal: 18)),
                ),
                16.hGap,
                Text(
                  'На сайте вы сможете подобрать психолога, посетить психологические семинары'
                  'и вебинары от лучших психологов метода, получить инструменты для самопомощи,'
                  'пройти психологические тесты, купить'
                  'близким подарочный сертификат',
                  style: context.textStyle.s14w400inter,
                  textAlign: TextAlign.center,
                ),
                32.hGap,
              ],
            ),
            Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: context.color.containerBackground2,
                borderRadius: BorderRadius.circular(19),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      read.onLeftSelected(true);
                    },
                    child: AnimatedContainer(
                      height: 93,
                      duration: Duration(milliseconds: 200),
                      width: watch.isLeftSelected
                          ? 0.46.wp(context)
                          : 0.41.wp(context),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: watch.isLeftSelected
                            ? context.color.background2
                            : context.color.containerBackground2,
                        borderRadius: BorderRadius.circular(16),
                        // boxShadow: isLeftSelected
                        //     ? [
                        //         BoxShadow(
                        //             color: Colors.black26, blurRadius: 5)
                        //       ]
                        //     : [],
                      ),
                      child: FittedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(AppIcons.icPerson),
                            Text(
                              "Для себя",
                              style: context.textStyle.s16w500inter
                                  .copyWith(color: context.color.textGrey2),
                            ),
                            FittedBox(
                              child: Text("от 2000 ₽ ~ 50 минут",
                                  style: context.textStyle.s16w500inter
                                      .copyWith(
                                          fontSize: 12,
                                          color: context.color.textGrey2)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Spacer(),
                  // SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      read.onLeftSelected(false);
                    },
                    child: AnimatedContainer(
                      height: 93,
                      duration: Duration(milliseconds: 200),
                      width: !watch.isLeftSelected
                          ? 0.46.wp(context)
                          : 0.41.wp(context),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: !watch.isLeftSelected
                            ? context.color.background2
                            : context.color.containerBackground2,
                        borderRadius: BorderRadius.circular(16),
                        // boxShadow: !isLeftSelected
                        //     ? [
                        //         BoxShadow(
                        //             color: Colors.black26, blurRadius: 5)
                        //       ]
                        //     : [],
                      ),
                      child: FittedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(AppIcons.icPeople),
                            Text(
                              "Для двоих",
                              style: context.textStyle.s16w500inter
                                  .copyWith(color: context.color.textGrey2),
                            ),
                            FittedBox(
                              child: Text("от 4850 ₽ ~ 1,5 часа",
                                  style: context.textStyle.s16w500inter
                                      .copyWith(
                                          fontSize: 12,
                                          color: context.color.textGrey2)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            20.hGap,
            AppButton(
              contentPadding: EdgeInsets.symmetric(horizontal: 50),
              height: 45,
              width: double.infinity,
              onPressed: () {},
              text: 'Подобрать психолога',
            ),
            6.hGap,
            AppButton(
              contentPadding: EdgeInsets.symmetric(horizontal: 50),
              appButtonType: AppButtonType.outlined,
              height: 45,
              width: double.infinity,
              onPressed: () {},
              text: 'Подписка «Самопомощь»',
            ),
            20.hGap,
            AppButton(
              contentPadding: EdgeInsets.symmetric(horizontal: 50),
              height: 45,
              width: double.infinity,
              onPressed: () {
                context.push(RouteNames.splash);
                // context.push(RouteNames.login);
              },
              text: 'Войти',
            ),
          ],
        ).padding(EdgeInsets.symmetric(horizontal: 20)),
      ],
    );
  }
}
