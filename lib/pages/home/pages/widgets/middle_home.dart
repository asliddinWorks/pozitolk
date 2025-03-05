import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pozitolk/core/extension/context_extension.dart';
import 'package:pozitolk/core/extension/num_extension.dart';
import 'package:pozitolk/core/extension/widget_extension.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../constants/app_icons.dart';
import '../../../../constants/app_images.dart';
import '../../../../core/widgets/app_button.dart';
import '../../view_model/home_view_model.dart';

class MiddleHome extends StatelessWidget {
  const MiddleHome({super.key});

  @override
  Widget build(BuildContext context) {
    final read = context.read<HomeViewModel>();
    final watch = context.watch<HomeViewModel>();
    double fontScale = MediaQuery.of(context).textScaler.scale(1.0);
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 20),
          height: 500 * fontScale,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: context.color.background1,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ListView(
                shrinkWrap: true,
                physics: RangeMaintainingScrollPhysics(),
                children: [
                  Text(
                    'Подписка «Самопомощь»',
                    style: context.textStyle.s20w500inter,
                  ),
                  12.hGap,
                  Text(
                    'Наши специалисты подготовили для Вас необходимую информацию на разные темы для самопомощи. Изучать её можно в своем темпе и в удобное для Вас время.',
                    style: context.textStyle.s16w500inter
                        .copyWith(color: context.color.textGrey2),
                  ),
                ],
              ),
              // 26.hGap,
              SizedBox(
                height: 200,
                width: 180,
                child: Image.asset(AppImages.subscribe),
              ),
              // 26.hGap,
              AppButton(
                width: double.infinity,
                height: 45,
                onPressed: () {
                  launchUrlString('https://xn--g1acgdmcd1a.xn--p1ai/docs/polz-sogl.pdf');
                },
                text: 'Купить подписку',
              ),
            ],
          ),
        ),
        100.hGap,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'что стоит ожидать от первой сессии',
              style: context.textStyle.s24w400,
            ),
            24.hGap,
            Text(
              'За 50 минут сессии:',
              style: context.textStyle.s20w500inter,
            ),
            20.hGap,
            Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.color.primary,
                  ),
                ),
                12.wGap,
                SizedBox(
                  width: .8.wp(context),
                  child: Text(
                    'Познакомитесь друг с другом ',
                    style: context.textStyle.s16w500inter.copyWith(
                      color: context.color.textGrey2,
                    ),
                  ),
                ),
              ],
            ),
            16.hGap,
            Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.color.primary,
                  ),
                ),
                12.wGap,
                SizedBox(
                  width: .8.wp(context),
                  child: Text(
                    'Уточните запрос и наметите план психотерапии ',
                    style: context.textStyle.s16w500inter.copyWith(
                      color: context.color.textGrey2,
                    ),
                  ),
                ),
              ],
            ),
            16.hGap,
            Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.color.primary,
                  ),
                ),
                12.wGap,
                SizedBox(
                  width: .8.wp(context),
                  child: Text(
                    'Найдете ответы на волнующие Вас вопросы',
                    style: context.textStyle.s16w500inter.copyWith(
                      color: context.color.textGrey2,
                    ),
                  ),
                ),
              ],
            ),
            16.hGap,
            Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.color.primary,
                  ),
                ),
                12.wGap,
                SizedBox(
                  width: .8.wp(context),
                  child: Text(
                    'Получите поддержку и лучше поймете свою ситуацию',
                    style: context.textStyle.s16w500inter.copyWith(
                      color: context.color.textGrey2,
                    ),
                  ),
                ),
              ],
            ),
            20.hGap,
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
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: context.color.containerBackground2,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: context.color.background2,
                    ),
                    child: Image.asset(AppImages.psychologist),
                  ),
                  4.hGap,
                  Container(
                    padding: EdgeInsets.all(16),
                    width: double.infinity,
                    height: 130*fontScale,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: context.color.background2,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(watch.forMyself, style: context.textStyle.s20w500inter),
                        // 8.hGap,
                        Text(
                          watch.psychologistTime,
                          style: context.textStyle.s16w500inter.copyWith(
                            color: context.color.textGrey2,
                          ),
                        ),
                        // 8.hGap,
                        AppButton(
                          contentPadding: EdgeInsets.symmetric(horizontal: 35),
                          width: double.infinity,
                          height: 45,
                          onPressed: () {},
                          text: 'Подобрать психолога',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ).padding(EdgeInsets.symmetric(horizontal: 20)),
      ],
    );
  }
}
