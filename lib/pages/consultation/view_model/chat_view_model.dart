
import 'package:flutter/cupertino.dart';
import 'package:pozitolk/pages/consultation/data/models/message_model.dart';

class ChatViewModel extends ChangeNotifier {
  // MessageModel messageModel = MessageModel();
  ChatModel chatModel = ChatModel();
  int index = 0;
  bool isMessageOpen = false;
  TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  List chatUsers = [
    ChatModel(
      id: 1,
      name: 'John Doe',
      avatar: 'https://images.unsplash.com/photo-1654110455429-cf322b40a906?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGF2YXRhcnxlbnwwfHwwfHx8MA%3D%3D',
      messages: [
        MessageModel(
          id: 1,
          senderId: 1,
          receiverId: 2,
          message: 'i am fine',
          timestamp: '12:20',
          isMe: true,
          type: MessageType.text,
        ),
        MessageModel(
          id: 1,
          senderId: 1,
          receiverId: 2,
          message: 'Hello how are you',
          timestamp: '12:10',
          isMe: false,
          type: MessageType.text,
        ),
        MessageModel(
          id: 1,
          senderId: 1,
          receiverId: 2,
          message: 'Hello',
          timestamp: '12:00',
          isMe: true,
          type: MessageType.text,
        ),
      ],
    ),
    ChatModel(
      id: 2,
      name: 'Getty',
      avatar: 'https://plus.unsplash.com/premium_photo-1658527049634-15142565537a?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8YXZhdGFyfGVufDB8fDB8fHww',
      messages: [
        MessageModel(
          id: 1,
          senderId: 1,
          receiverId: 2,
          message: 'i am fine, you too?,  how are you',
          timestamp: '14:20',
          isMe: true,
          type: MessageType.text,
        ),
        MessageModel(
          id: 1,
          senderId: 1,
          receiverId: 2,
          message: 'Hello how are you',
          timestamp: '14:10',
          isMe: false,
          type: MessageType.text,
        ),
        MessageModel(
          id: 1,
          senderId: 1,
          receiverId: 2,
          message: 'Hello',
          timestamp: '14:00',
          isMe: true,
          type: MessageType.text,
        ),
      ],
    ),
    ChatModel(
      id: 1,
      name: 'Diego',
      avatar: '',
      messages: [
        MessageModel(
          id: 1,
          senderId: 1,
          receiverId: 2,
          message: 'i am fine',
          timestamp: '16:20',
          isMe: true,
          type: MessageType.text,
        ),
        MessageModel(
          id: 1,
          senderId: 1,
          receiverId: 2,
          message: 'Hello how are you',
          timestamp: '16:10',
          isMe: false,
          type: MessageType.text,
        ),
        MessageModel(
          id: 1,
          senderId: 1,
          receiverId: 2,
          message: 'Hello',
          timestamp: '16:00',
          isMe: true,
          type: MessageType.text,
        ),
      ],
    ),
  ];

  void setState() => notifyListeners();

  void scrollToBottom() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        0,
        duration: Duration(milliseconds: 100),
        curve: Curves.easeOut,
      );
      notifyListeners();
    }
  }

  void sendMessage() {
    if (messageController.text.isNotEmpty) {
      chatUsers[index].messages.insert(0, MessageModel(
        isMe: true,
        message: messageController.text,
        receiverId: 2,
        senderId: 1,
        timestamp: DateTime.now().toString(),
        type: MessageType.text,
      ));
    }
    messageController.clear();
    notifyListeners();
  }

}

