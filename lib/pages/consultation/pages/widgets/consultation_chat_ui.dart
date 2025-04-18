import 'package:flutter/cupertino.dart';
import 'package:pozitolk/core/extension/context_extension.dart';
import 'package:pozitolk/core/extension/num_extension.dart';
import 'package:pozitolk/pages/consultation/pages/items/chat_item.dart';
import 'package:pozitolk/pages/consultation/view_model/chat_view_model.dart';
import 'package:provider/provider.dart';

class ConsultationChatUi extends StatelessWidget {
  const ConsultationChatUi({super.key});

  @override
  Widget build(BuildContext context) {
    final read = context.read<ChatViewModel>();
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
            Text(
              'Чаты',
              style: context.textStyle.s16w600Manrope.copyWith(fontSize: 20),
            ),
            16.hGap,
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => ChatItem(
                chatModel: read.chatUsers[index],
              ),
              itemCount: read.chatUsers.length,
              // itemCount: 15,
            ),
            30.hGap
          ],
        ),
      ),
    );
  }
}
