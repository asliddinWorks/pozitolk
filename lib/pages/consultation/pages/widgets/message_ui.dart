import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:pozitolk/core/extension/context_extension.dart';
import 'package:pozitolk/core/extension/num_extension.dart';
import 'package:pozitolk/core/extension/widget_extension.dart';
import 'package:pozitolk/core/widgets/app_text_field2.dart';
import 'package:pozitolk/pages/consultation/data/models/message_model.dart';
import 'package:pozitolk/pages/consultation/pages/items/message_item.dart';
import 'package:provider/provider.dart';
import '../../../../constants/app_images.dart';
import '../../view_model/chat_view_model.dart';

class MessageUi extends StatefulWidget {
  const MessageUi({super.key, required this.chatModel});
  final ChatModel chatModel;

  @override
  State<MessageUi> createState() => _MessageUiState();
}

class _MessageUiState extends State<MessageUi> {

  @override
  void initState() {
    ChatViewModel chatViewModel = context.read<ChatViewModel>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(milliseconds: 200), chatViewModel.scrollToBottom);  });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final watch = context.watch<ChatViewModel>();
    final read = context.read<ChatViewModel>();
    return PopScope(
      canPop: !watch.isMessageOpen,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop && read.isMessageOpen) {
          read.isMessageOpen = false;
          read.setState();
        }
      },
      child: Container(
          padding: EdgeInsets.all(16),
          // height: context.height * .95,
          margin: const EdgeInsets.only(top: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            color: context.color.background2,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Чаты /',
                    style: context.textStyle.s20w600Manrope
                        .copyWith(color: context.color.textGrey3),
                  ),
                  8.wGap,
                  ClipOval(
                    child: Image(
                      image: widget.chatModel.avatar.toString() == 'null' || widget.chatModel.avatar.toString() == '' ? AssetImage(AppImages.defaultImage) : NetworkImage(widget.chatModel.avatar.toString()),
                      height: 32,
                      width: 32,
                    ),
                  ),
                  8.wGap,
                  Text(
                    widget.chatModel.name.toString(),
                    style: context.textStyle.s20w600Manrope,
                  ),
                ],
              ),
              // Spacer(),
              Expanded(
                child: ListView.builder(
                  reverse: true,
                  shrinkWrap: true,
                  controller: read.scrollController,
                  // shrinkWrap: true,
                  // physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => MessageItem(
                    avatar: widget.chatModel.avatar.toString(),
                    messageModel: widget.chatModel.messages![index],
                  ),
                  itemCount: widget.chatModel.messages!.length,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: AppTextField2(
                      fillColor: context.color.base04,
                      onTap: (){Future.delayed(Duration(milliseconds: 300), read.scrollToBottom);},
                      controller: read.messageController,
                      hintText: 'Введите текст',
                      hintStyle: context.textStyle.s14w500Manrope
                          .copyWith(color: context.color.accent1),
                    ),
                  ),
                  Transform.rotate(
                    angle: -35 * math.pi / 180,
                    child: IconButton(
                      onPressed: () {
                        read.sendMessage();
                      },
                      icon: Icon(Icons.send_rounded, color: context.color.primary, size: 30,),
                    ),
                  ).padding(EdgeInsets.only(bottom: 5)),
                ],
              ),
            ],
          )),
    );
  }
}
