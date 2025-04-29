import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pozitolk/core/extension/context_extension.dart';
import 'package:pozitolk/core/extension/num_extension.dart';
import 'package:pozitolk/core/extension/widget_extension.dart';
import 'package:pozitolk/pages/consultation/view_model/chat_view_model.dart';
import 'package:provider/provider.dart';

import '../../../../constants/app_icons.dart';
import '../../view_model/consultation_view_model.dart';

class ConsultationDrawer extends StatelessWidget {
  const ConsultationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final read = context.read<ConsultationViewModel>();
    final readChat = context.read<ChatViewModel>();
    final watch = context.watch<ConsultationViewModel>();
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          10.hGap,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(AppIcons.icLogo),
              5.wGap,
              Column(
                children: [
                  3.hGap,
                  Text(
                    'позитолк',
                    style: context.textStyle.s16w400
                        .copyWith(fontSize: 17.5),
                  ),
                  // Text('Психотерапия brbhr', style: GoogleFonts.leckerliOne(color: context.color.primary)),
                ],
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  read.onSettings();
                  readChat.isMessageOpen = false;
                  context.pop();
                },
                child: Container(
                  // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: context.color.background1,
                  ),
                  child: Transform.scale(
                    scale: 0.55,
                    child: SvgPicture.asset(
                      colorFilter: ColorFilter.mode(
                        watch.drawerItem[7] ? context.color.primary : context.color.textBA,
                        BlendMode.srcIn,
                      ),
                      AppIcons.icSettings,
                      fit: BoxFit.contain,
                      allowDrawingOutsideViewBox: true,
                    ),
                  ),
                ),
              ),
              8.wGap,
              GestureDetector(
                onTap: () {
                  read.key.currentState!.closeEndDrawer();
                },
                child: Container(
                  // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: context.color.background1,
                  ),
                  child: Transform.scale(
                    scale: 0.55,
                    child: SvgPicture.asset(
                      AppIcons.icDrawer,
                      colorFilter: ColorFilter.mode(
                        context.color.primary,
                        BlendMode.srcIn,
                      ),
                      fit: BoxFit.contain,
                      allowDrawingOutsideViewBox: true,
                    ),
                  ),
                ),
              ),
            ],
          ).padding(EdgeInsets.symmetric(horizontal: 16)),
          10.hGap,
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => GestureDetector(
                onTap: () async {
                  read.onDrawerSelected(context, index);
                  if (index == 1) {
                    read.isLoading = true;
                    read.onSetState();
                    await readChat.getChatList();
                    read.isLoading = false;
                    readChat.isMessageOpen = false;
                    read.onSetState();
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 48,
                  color: watch.drawerItem[index]
                      ? context.color.primary
                      : context.color.background2,
                  // color: context.color.primary,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        read.drawerIcon[index],
                        colorFilter: ColorFilter.mode(
                          watch.drawerItem[index] ? context.color.background2 : context.color.text,
                          BlendMode.srcIn,
                        ),
                        height: 20,
                        width: 20,
                      ),
                      8.wGap,
                      Text(
                        read.drawerText[index],
                        style: context.textStyle.s14w400inter.copyWith(
                          color: watch.drawerItem[index]
                              ? context.color.background2
                              : context.color.text,
                        ),
                      ),
                    ],
                  ).padding(EdgeInsets.symmetric(horizontal: 20)),
                ),
              ),
              itemCount: 7,
            ),
          ),
        ],
      ),
    );
  }
}
