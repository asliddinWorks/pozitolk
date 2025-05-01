import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pozitolk/core/extension/context_extension.dart';
import 'package:pozitolk/core/extension/num_extension.dart';
import 'package:pozitolk/core/extension/widget_extension.dart';
import 'package:pozitolk/pages/consultation/pages/items/chat_item.dart';
import 'package:pozitolk/pages/consultation/view_model/chat_view_model.dart';
import 'package:provider/provider.dart';

import '../../../../router/router.dart';
import '../../view_model/consultation_view_model.dart';

class ConsultationChatUi extends StatefulWidget  {
  const ConsultationChatUi({super.key});

  @override
  State<ConsultationChatUi> createState() => _ConsultationChatUiState();
}

class _ConsultationChatUiState extends State<ConsultationChatUi> {
  late ChatViewModel read;
  late ConsultationViewModel readConsultation;
  @override
  void initState() {
    read = context.read<ChatViewModel>();
    readConsultation = context.read<ConsultationViewModel>();
    WidgetsBinding.instance.addPostFrameCallback((_)async {
      // Future.delayed(Duration(milliseconds: 200),);
      read.isMessageOpen = false;
      await read.getChatList();
      readConsultation.key.currentState!.closeEndDrawer();
      // readConsultation.onDrawerSelected(context, 1);

      readConsultation.motionTabBarController?.index = 3;
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final read = context.read<ChatViewModel>();
    final watch = context.watch<ChatViewModel>();
    return Container(
      padding: EdgeInsets.all(16),
      height: context.height * .85,
      margin: const EdgeInsets.only(top: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        color: context.color.background2,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: (){
                context.push(RouteNames.new2);
              },
              child: Text(
                'Чаты',
                style: context.textStyle.s16w600Manrope.copyWith(fontSize: 20),
              ),
            ),
            16.hGap,
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => ChatItem(
                index: index,
                chatModel: read.chatUsers[index],
              ),
              itemCount: read.chatUsers.length,
              // itemCount: 15,
            ),
            30.hGap
          ],
        ),
      ),
    ).loadingView(watch.isLoading);
  }
}
