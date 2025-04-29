import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pozitolk/constants/app_images.dart';
import 'package:pozitolk/core/extension/context_extension.dart';
import 'package:pozitolk/core/extension/num_extension.dart';
import 'package:pozitolk/pages/consultation/data/models/message_model.dart';
import 'package:provider/provider.dart';
import '../../../../core/data/data_source/local/app_local_data.dart';
import '../../view_model/chat_view_model.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({super.key, required this.chatModel, required this.index});
  final ChatModel chatModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    final read = context.read<ChatViewModel>();
    return GestureDetector(
      onTap: () async{
        Map userModel = await  AppLocalData.getUserModel;
        read.userId = userModel['id'];
        read.chatId = chatModel.id!;
        read.isMessageOpen = true;
        read.chatModel = chatModel;
        read.index = index;
        read.initWebSocket();
        read.connectWebSocket();
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
                image: chatModel.clientAvatar.toString() == 'null' ||
                        chatModel.clientAvatar.toString() == ''
                    ? AssetImage(AppImages.defaultImage)
                    : NetworkImage(chatModel.clientAvatar.toString()),
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
                    chatModel.clientNickname.toString(),
                    style: context.textStyle.s16w600Manrope,
                  ),
                  4.hGap,
                  Text(
                    // '',
                    chatModel.lastMessage!.text.toString() == 'null' ||
                            chatModel.lastMessage!.text.toString() == ''
                        ? ''
                        : chatModel.lastMessage!.text.toString(),
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
                Text(
                  // '',
                  chatModel.lastMessage!.sender.toString() == 'null' ||
                          chatModel.lastMessage!.sender.toString() == ''
                      ? ''
                      : read.formatDateTime(chatModel.lastMessage!.createdAt!,),
                  // chatModel.lastMessage!.createdAt.toString(),
                  style: context.textStyle.s14w500Manrope
                      .copyWith(fontSize: 12, height: 1.9),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
