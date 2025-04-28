import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pozitolk/core/extension/context_extension.dart';
import 'package:pozitolk/core/extension/num_extension.dart';
import 'package:pozitolk/core/extension/widget_extension.dart';
import 'package:pozitolk/core/widgets/app_button.dart';
import 'package:pozitolk/core/widgets/app_text_field2.dart';
import 'package:pozitolk/pages/consultation/data/models/message_model.dart';
import 'package:pozitolk/pages/consultation/pages/items/message_item.dart';
import 'package:provider/provider.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../../../../constants/app_images.dart';
import '../../../../core/utils/app_custom_dialog.dart';
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
      Future.delayed(Duration(milliseconds: 500), chatViewModel.scrollToBottom);
      chatViewModel.initChatPagination();
    });
    chatViewModel.channel = WebSocketChannel.connect(
      Uri.parse('wss://backend.xn--g1acgdmcd1a.xn--p1ai/api/schema/swagger-ui/#/ws/chat/1/?token=9db3a903c8b23b39e44ded75db9176c5997f6ea9&user_type=psychologist'),
    );
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
                      image: widget.chatModel.clientAvatar.toString() == 'null' ||
                              widget.chatModel.clientAvatar.toString() == ''
                          ? AssetImage(AppImages.defaultImage)
                          : NetworkImage(widget.chatModel.clientAvatar.toString()),
                      height: 32,
                      width: 32,
                    ),
                  ),
                  8.wGap,
                  Text(
                    widget.chatModel.clientNickname.toString(),
                    style: context.textStyle.s20w600Manrope,
                  ),
                  Spacer(),
                  PopupMenuButton<String>(
                    icon: const Icon(Icons.more_vert), // Gorizontal 3 nuqta
                    onSelected: (value) {
                      if (value == '1') {
                        appCustomDialog(
                          context,
                          Container(
                            padding: EdgeInsets.all(16),
                            width: context.width * .9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: context.color.background2,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: context.width * .7,
                                      child: Text(
                                        'Константипольский больше не работает с Вами на ПозиТолк',
                                        style: context.textStyle.s22w600Manrope,
                                      ),
                                    ),
                                    Spacer(),
                                    GestureDetector(
                                        onTap: () {
                                          context.pop();
                                        },
                                        child: Icon(
                                          Icons.close,
                                        )),
                                  ],
                                ),
                                16.hGap,
                                Image(
                                  image: AssetImage(
                                    AppImages.smail,
                                  ),
                                  height: 61,
                                  width: 106,
                                ),
                                32.hGap,
                                AppButton(
                                  width: double.infinity,
                                  height: 45,
                                  onPressed: () {
                                    context.pop();
                                  },
                                  text: 'Удалить чат',
                                )
                              ],
                            ),
                          ),
                          // paddingHorizontal: 32,
                          // paddingVertical: 32,
                          radius: 16,
                        );
                      }
                      // Menyudan tanlangan element
                      // ScaffoldMessenger.of(context).showSnackBar(
                      // SnackBar(content: Text("Tanlandi: $value")),
                      // );
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      const PopupMenuItem<String>(
                        value: '1',
                        child: Text('Удалить'),
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: PagedListView(
                  shrinkWrap: true,
                  reverse: true,
                  pagingController: watch.chatController,
                  builderDelegate: PagedChildBuilderDelegate<MessageModel>(
                    noItemsFoundIndicatorBuilder: (context) => const Center(
                      child: Text('информация недоступна'),
                    ),
                    itemBuilder: (context, item, index) => MessageItem(
                      avatar: widget.chatModel.clientAvatar.toString(),
                      messageModel: item,
                      isMe: read.userId != item.sender ? false : true, //isMe: true,
                    ),
                  ),
                ),
              ),
              // Spacer(),
              // Expanded(
              //   child: ListView.builder(
              //     reverse: true,
              //     shrinkWrap: true,
              //     controller: read.scrollController,
              //     // shrinkWrap: true,
              //     // physics: BouncingScrollPhysics(),
              //     itemBuilder: (context, index) => MessageItem(
              //       avatar: widget.chatModel.clientAvatar.toString(),
              //       messageModel: widget.chatModel.lastMessage!,
              //       isMe: true,
              //     ),
              //     itemCount: 1,
              //   ),
              // ),
              Row(
                children: [
                  Expanded(
                    child: AppTextField2(
                      fillColor: context.color.base04,
                      onTap: () {
                        Future.delayed(
                            Duration(milliseconds: 300), read.scrollToBottom);
                      },
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
                        read.sendMessage(read.messageController.text);
                      },
                      icon: Icon(
                        Icons.send_rounded,
                        color: context.color.primary,
                        size: 30,
                      ),
                    ),
                  ).padding(EdgeInsets.only(bottom: 5)),
                ],
              ),
            ],
          )),
    );
  }
}
