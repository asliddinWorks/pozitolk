import 'package:flutter/cupertino.dart';
import 'package:pozitolk/core/extension/context_extension.dart';
import 'package:pozitolk/core/extension/num_extension.dart';
import 'package:provider/provider.dart';
import '../../../../constants/app_images.dart';
import '../../data/models/message_model.dart';
import '../../view_model/chat_view_model.dart';

class MessageItem extends StatelessWidget {
  const MessageItem(
      {super.key, required this.messageModel, required this.avatar, required this.isMe});
  final MessageModel messageModel;
  final bool isMe;
  final String avatar;
  @override
  Widget build(BuildContext context) {
    final read = context.read<ChatViewModel>();
    return Column(
      children: [
        Row(
          mainAxisAlignment: isMe
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: [
            isMe
                ? 0.wGap
                : Container(
                    clipBehavior: Clip.hardEdge,
                    height: 44,
                    width: 44,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: avatar == '' || avatar == 'null'
                        ? Image(image: AssetImage(AppImages.defaultImage))
                        : Image(image: NetworkImage(avatar)),
                  ),
            isMe ? 0.wGap : 14.wGap,
            Column(
              crossAxisAlignment: isMe
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                Container(
                  constraints: BoxConstraints(maxWidth: .7.wp(context)),
                  // width: .75.wp(context),
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isMe
                        ? context.color.secondary700
                        : context.color.base01,
                    borderRadius: isMe
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
                  child: Text(messageModel.text ?? '',
                      style: isMe
                          ? context.textStyle.s14w500Manrope
                              .copyWith(color: context.color.background2)
                          : context.textStyle.s14w500Manrope),
                ),
                4.hGap,
                Text(
                  messageModel.sender.toString() == 'null' ||
                      messageModel.sender.toString() == ''
                      ? ''
                      : read.formatDateTime(messageModel.createdAt!,),
                  style: context.textStyle.s16w400inter
                      .copyWith(color: context.color.textGrey3, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
