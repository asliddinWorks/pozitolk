
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pozitolk/core/data/data_source/local/app_local_data.dart';
import 'package:pozitolk/pages/consultation/data/consultation_repo/chat_repo.dart';
import 'package:pozitolk/pages/consultation/data/models/message_model.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatViewModel extends ChangeNotifier {
  ChatViewModel(this.chatRepo);
  final ChatRepo chatRepo;
  int userId = 0;
  MessageModel messageModel = MessageModel();
  ChatModel chatModel = ChatModel();
  int index = 0;
  bool isMessageOpen = false;
  TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  // final wsUrl = Uri.parse('ws://example.com');
  // final channel = WebSocketChannel.connect(wsUrl);
  late WebSocketChannel channel;

  void onMessage() async {
    final wsUrl = Uri.parse('wss://backend.xn--g1acgdmcd1a.xn--p1ai/ws/chat/13/?token=c5f2f416a1f563de1e251a679072c1dee701a5fb&user_type=psychologist');
    final channel = WebSocketChannel.connect(wsUrl);

    await channel.ready;

    channel.stream.listen((message) {
      print(message);
      channel.sink.add('received!');
      channel.sink.close(status.goingAway);
    });
    print('okk');
  }

  void initWebSocket() async{
    final token = await AppLocalData.getUserToken;
    channel = WebSocketChannel.connect(
    Uri.parse('wss://backend.xn--g1acgdmcd1a.xn--p1ai/ws/chat/13/?token=c5f2f416a1f563de1e251a679072c1dee701a5fb&user_type=psychologist'),);
    print('urlllllllll ');
  }

  void addNewMessage(MessageModel message) {
    final currentItems = chatController.itemList ?? [];
    chatController.itemList = [...currentItems, message];
  }

  void connectWebSocket() {
    print('sokkked');
    channel = WebSocketChannel.connect(
      Uri.parse('wss://backend.xn--g1acgdmcd1a.xn--p1ai/ws/chat/13/?token=c5f2f416a1f563de1e251a679072c1dee701a5fb&user_type=psychologist'),
    );

    // Mana shu yerga yozamiz 👇
    channel.stream.listen((data) {
      print(data);
      final jsonData = jsonDecode(data);
      final incomingChatId = jsonData['id']; // 👈 chatId olamiz

      if (incomingChatId == chatModel.id) {
        // 👈 Faqat ochilgan chat uchun xabar qo‘shamiz
        final newMessage = MessageModel.fromJson(jsonData);
        addNewMessage(newMessage);
        notifyListeners();
      } else {
        // 👈 Agar boshqa chat uchun bo'lsa, belgilab qo'yish, notification qilish mumkin

      }
    });

  }

  void sendMessage(String text) {
    if (text.isNotEmpty) {
      final myMessage = MessageModel(
        text: text,
      );

      addNewMessage(myMessage); // Avval local qo‘shamiz

      final messageJson = jsonEncode({
        // 'chatId': selectedChatId,  // 👈 Chat ID qo‘shamiz!
        'senderId': userId,
        'text': text,
        'createdAt': DateTime.now().toIso8601String(),
      });

      channel.sink.add(messageJson); // 👈 json yuboramiz
      notifyListeners();
    }
  }


  List chatUsers = [
      // ChatModel(
      //   id: 1,
      //   name: 'John Doe',
      //   avatar: 'https://images.unsplash.com/photo-1654110455429-cf322b40a906?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGF2YXRhcnxlbnwwfHwwfHx8MA%3D%3D',
      //   messages: [
      //     MessageModel(
      //       id: 1,
      //       senderId: 1,
      //       receiverId: 2,
      //       message: 'i am fine',
      //       timestamp: '12:20',
      //       isMe: true,
      //       type: MessageType.text,
      //     ),
      //     MessageModel(
      //       id: 1,
      //       senderId: 1,
      //       receiverId: 2,
      //       message: 'Hello how are you',
      //       timestamp: '12:10',
      //       isMe: false,
      //       type: MessageType.text,
      //     ),
      //     MessageModel(
      //       id: 1,
      //       senderId: 1,
      //       receiverId: 2,
      //       message: 'Hello',
      //       timestamp: '12:00',
      //       isMe: true,
      //       type: MessageType.text,
      //     ),
      //   ],
      // ),
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

    // void sendMessage() {
    //   if (messageController.text.isNotEmpty) {
    //     chatUsers[index].messages.insert(0, MessageModel(
    //       // isMe: true,
    //       // message: messageController.text,
    //       // receiverId: 2,
    //       // senderId: 1,
    //       // timestamp: DateTime.now().toString(),
    //       // type: MessageType.text,
    //     ));
    //   }
    //   messageController.clear();
    //   notifyListeners();
    // }

    Future<void> getChatList() async {
      chatUsers = await chatRepo.getChatList();
      print('qqqqq');
      print(chatUsers);
      notifyListeners();
    }

    String formatDateTime(DateTime? dateTime) {
      if (dateTime == null) return '';
      final now = DateTime.now();
      final isToday = now.year == dateTime.year &&
          now.month == dateTime.month &&
          now.day == dateTime.day;

      final hours = dateTime.hour.toString().padLeft(2, '0');
      final minutes = dateTime.minute.toString().padLeft(2, '0');

      if (isToday) {
        return '$hours : $minutes';
      } else {
        final day = dateTime.day.toString().padLeft(2, '0');
        final month = dateTime.month.toString().padLeft(2, '0');
        final year = dateTime.year;
        return '$day.$month.$year  $hours:$minutes';
      }
    }

    bool isLoading = false;
    int chatId = 0;

    static const int _pageSize = 8;
    PagingController<int, MessageModel> chatController = PagingController(
        firstPageKey: 1);

    void initChatPagination() {
      // chatController.dispose();
      try {
        print('ppppwpwfpwfpwfpwfpwfpwfwpfwfpwf');
        chatController = PagingController(firstPageKey: 1);
        chatController.addPageRequestListener((int pageKey) async {
          print('onnnnnn');
          await messagePagination(pageKey);
        });
        chatController.notifyPageRequestListeners(1);
      } catch (e) {
        print('Pizdes');
        print(e);
      }
    }

    Future<void> messagePagination(int page) async {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        isLoading = true;
        notifyListeners();
      });
      try {
        print('ohaaa');
        final contents = await chatRepo.getChatPagination(
            page, _pageSize, chatId);
        final isLastPage = contents.length < _pageSize;
        if (isLastPage) {
          chatController.appendLastPage(contents);
        } else {
          final nextPageKey = page + 1;
          chatController.appendPage(contents, nextPageKey);
        }
        print('haaa');
      } catch (e) {
        print(e);
        isLoading = false;
      }

      isLoading = false;
      notifyListeners();
    }
}

