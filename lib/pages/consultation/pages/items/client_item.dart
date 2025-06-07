import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pozitolk/core/extension/context_extension.dart';
import 'package:pozitolk/core/extension/num_extension.dart';
import 'package:pozitolk/core/extension/widget_extension.dart';
import 'package:pozitolk/core/utils/app_custom_dialog.dart';
import 'package:pozitolk/pages/consultation/data/models/client_model.dart';
import '../../../../constants/app_icons.dart';
import '../../../../core/utils/format_date.dart';

class ClientItem extends StatelessWidget {
  const ClientItem({super.key, required this.clientModel});
  final ClientModel clientModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        appCustomDialog(
          radius: 16,
          context,
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: context.height * .8),
            child: Container(
              // margin: EdgeInsets.symmetric(vertical: 80),
              // height: context.height * .8,
              width: context.width * .9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: context.color.background2,
              ),
              padding: EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Клиенты', style: context.textStyle.s20w600Manrope),
                    16.hGap,
                    Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: context.color.background1,
                          ),
                          alignment: Alignment.center,
                          child: clientModel.avatarUrl == null ? null : Image.network(clientModel.avatarUrl ?? ''),
                        ),
                        12.wGap,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Имя/Псевдоним', style: context.textStyle.s14w400Manrope, overflow: TextOverflow.ellipsis,),
                              6.hGap,
                              Text(clientModel.nickname ?? '', style: context.textStyle.s16w500Manrope, overflow: TextOverflow.ellipsis,),
                            ],
                          ),
                        ),
                        12.wGap,
                        SizedBox(
                          width: 85,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Возраст', style: context.textStyle.s14w400Manrope),
                              6.hGap,
                              Text('${clientModel.age.toString()} года', style: context.textStyle.s16w500Manrope),
                            ],
                          ),
                        )
                      ],
                    ),
                    16.hGap,
                    Text('Запросы', style: context.textStyle.s16w600Manrope),
                    16.hGap,
                    Row(
                      children: [
                        SvgPicture.asset(AppIcons.icFaceSad, height: 20,),
                        12.wGap,
                        Text('Моё состояние:', style: context.textStyle.s14w500Manrope.copyWith(color: context.color.textBA,  fontWeight: FontWeight.w600)),
                      ],
                    ),
                    6.hGap,
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: clientModel.topics!.feeling!.map((feeling) => Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      decoration: BoxDecoration(
                        color: context.color.background1,
                        borderRadius: BorderRadius.circular(55),
                      ),
                      child: Text(
                        feeling,
                        style: context.textStyle.s16w500inter,
                      ),
                    )).toList(),
                    ),
                    16.hGap,
                    Row(
                      children: [
                        SvgPicture.asset(AppIcons.icHeart, height: 20,),
                        12.wGap,
                        Text('Отношения:', style: context.textStyle.s14w500Manrope.copyWith(color: context.color.textBA,  fontWeight: FontWeight.w600)),
                      ],
                    ),
                    6.hGap,
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: clientModel.topics!.relation!.map((feeling) => Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        decoration: BoxDecoration(
                          color: context.color.background1,
                          borderRadius: BorderRadius.circular(55),
                        ),
                        child: Text(
                          feeling,
                          style: context.textStyle.s16w500inter,
                        ),
                      )).toList(),
                    ),
                    16.hGap,
                    Row(
                      children: [
                        SvgPicture.asset(AppIcons.icWork, height: 27,),
                        12.wGap,
                        Text('Работа:', style: context.textStyle.s14w500Manrope.copyWith(color: context.color.textBA,  fontWeight: FontWeight.w600)),
                      ],
                    ),
                    6.hGap,
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: clientModel.topics!.workStudy!.map((feeling) => Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        decoration: BoxDecoration(
                          color: context.color.background1,
                          borderRadius: BorderRadius.circular(55),
                        ),
                        child: Text(
                          feeling,
                          style: context.textStyle.s16w500inter,
                        ),
                      )).toList(),
                    ),
                    16.hGap,
                    Row(
                      children: [
                        SvgPicture.asset(AppIcons.icLife, height: 27,),
                        12.wGap,
                        Text('События в жизни:', style: context.textStyle.s14w500Manrope.copyWith(color: context.color.textBA,  fontWeight: FontWeight.w600)),
                      ],
                    ),
                    6.hGap,
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: clientModel.topics!.lifeEvent!.map((feeling) => Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        decoration: BoxDecoration(
                          color: context.color.background1,
                          borderRadius: BorderRadius.circular(55),
                        ),
                        child: Text(
                          feeling,
                          style: context.textStyle.s16w500inter,
                        ),
                      )).toList(),
                    ),
                    16.hGap,
                    Row(
                      children: [
                        SvgPicture.asset(AppIcons.icHeart, height: 20,),
                        12.wGap,
                        Text('Паровая терапия:', style: context.textStyle.s14w500Manrope.copyWith(color: context.color.textBA,  fontWeight: FontWeight.w600)),
                      ],
                    ),
                    6.hGap,
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: clientModel.topics!.coupleTherapy!.map((feeling) => Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        decoration: BoxDecoration(
                          color: context.color.background1,
                          borderRadius: BorderRadius.circular(55),
                        ),
                        child: Text(
                          feeling,
                          style: context.textStyle.s16w500inter,
                        ),
                      )).toList(),
                    ),

                  ],
                ),
              ),
            ),
          ),
        );
      },
      child: Container(
        color: context.color.background2,
        height: 64,
        width: 757,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                    alignment: Alignment.center,
                    width: 55,
                    height: 64,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: clientModel.avatarUrl == null
                          ? SizedBox.shrink()
                          : Image.network(clientModel.avatarUrl ?? ''),
                    )),
                Container(
                  alignment: Alignment.centerLeft,
                  width: 220,
                  height: 56,
                  padding: EdgeInsets.only(left: 16),
                  child: Text(clientModel.nickname ?? '',
                      style: context.textStyle.s14w400Manrope),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: 150,
                  height: 56,
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    clientModel.sessionCount.toString(),
                    style: context.textStyle.s14w400Manrope,
                    maxLines: 2,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: 150,
                  height: 56,
                  padding: EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        getDateOnly(clientModel.lastSessionDate),
                        style: context.textStyle.s14w400Manrope,
                        maxLines: 1,
                      ),
                      Text(
                        getTimeOnly(clientModel.lastSessionDate),
                        style: context.textStyle.s14w400Manrope,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: 150,
                  height: 56,
                  padding: EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        getDateOnly(clientModel.futureSessionDate),
                        style: context.textStyle.s14w400Manrope,
                        maxLines: 1,
                      ),
                      Text(
                        getTimeOnly(clientModel.futureSessionDate),
                        style: context.textStyle.s14w400Manrope,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 1,
              color: context.color.base01,
              height: 0,
            )
            // Text(clientModel.nickname?? '',
            //     style: context.textStyle.s16w500Manrope),
          ],
        ).padding(EdgeInsets.symmetric(horizontal: 16)),
      ),
    );
  }
}
