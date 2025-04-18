import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pozitolk/constants/app_images.dart';
import 'package:pozitolk/core/extension/context_extension.dart';
import 'package:pozitolk/core/extension/num_extension.dart';
import 'package:pozitolk/pages/consultation/data/models/message_model.dart';
import 'package:provider/provider.dart';
import '../../view_model/chat_view_model.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({super.key, required this.chatModel});
  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    final read = context.read<ChatViewModel>();
    return GestureDetector(
      onTap: () {
        read.isMessageOpen = true;
        read.chatModel = chatModel;
        read.setState();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        height: 78,
        width: context.width,
        color: context.color.background2,
        child: Row(
          children: [
            Container(
              width: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              clipBehavior: Clip.hardEdge,
              child: Image(
                image: chatModel.avatar.toString() == 'null' ||
                        chatModel.avatar.toString() == ''
                    ? AssetImage(AppImages.defaultImage)
                    : NetworkImage(chatModel.avatar.toString()),
                fit: BoxFit.cover,
              ),
            ),
            12.wGap,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chatModel.name.toString(),
                    style: context.textStyle.s16w600Manrope,
                  ),
                  4.hGap,
                  Text(
                    chatModel.messages!.last.message.toString(),
                    style: context.textStyle.s14w500Manrope,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            // Spacer(),
            Column(
              children: [
                SizedBox(
                  width: 40,
                  child: Text(
                    chatModel.messages!.last.timestamp.toString(),
                    style: context.textStyle.s14w500Manrope
                        .copyWith(fontSize: 12, height: 1.9),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
