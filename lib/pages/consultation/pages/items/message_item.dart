import 'package:flutter/cupertino.dart';
import 'package:pozitolk/core/extension/context_extension.dart';
import 'package:pozitolk/core/extension/num_extension.dart';
import '../../../../constants/app_images.dart';
import '../../data/models/message_model.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({super.key, required this.messageModel, required this.avatar});
  final MessageModel messageModel;
  final String avatar;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
    Row(
    mainAxisAlignment: messageModel.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        messageModel.isMe ? 0.wGap : Container(
          clipBehavior: Clip.hardEdge,
          height: 44,
          width: 44,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: avatar == '' || avatar == 'null' ? Image(image: AssetImage(AppImages.defaultImage)) : Image(image: NetworkImage(avatar)),
        ),
        messageModel.isMe ? 0.wGap : 14.wGap,
        Column(
          crossAxisAlignment: messageModel.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: .7.wp(context)),
              // width: .75.wp(context),
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: messageModel.isMe ? context.color.secondary700 : context.color.base01,
                borderRadius: messageModel.isMe
                    ? BorderRadius.only(
                  topRight: Radius.circular(14),
                  bottomRight: Radius.circular(2),
                  bottomLeft: Radius.circular(14),
                  topLeft: Radius.circular(14),
                )
                    : BorderRadius.only(
                  topRight: Radius.circular(14),
                  bottomRight: Radius.circular(14),
                  bottomLeft: Radius.circular(2),
                  topLeft: Radius.circular(14),
                ),
              ),
              child: Text(
                messageModel.message,
                style: messageModel.isMe
                    ? context.textStyle.s14w500Manrope.copyWith(color: context.color.background2)
                    : context.textStyle.s14w500Manrope
              ),
            ),
            4.hGap,
            Text(messageModel.timestamp.toString(), style: context.textStyle.s16w400inter.copyWith(color: context.color.accent1, fontSize: 12),),
          ],
        )
      ],
    ),
      ],
    );
  }
}
