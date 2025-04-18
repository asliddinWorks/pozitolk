class MessageModel {
  final int? id;
  final int? senderId;
  final int? receiverId;
  final String message;
  final String? timestamp;
  final bool isMe; // foydalanuvchi o'zi yuborganmi yoki yo'qmi
  final MessageType? type;

  MessageModel({
    this.id,
    this.senderId,
    this.receiverId,
    required this.message,
    this.timestamp,
    required this.isMe,
    this.type,
  });

  // JSONdan obyektga o‘girish
  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'],
      senderId: json['senderId'],
      receiverId: json['receiverId'],
      message: json['message'],
      timestamp: json['timestamp'],
      isMe: json['isMe'],
      type: MessageType.values.firstWhere((e) => e.toString() == 'MessageType.${json['type']}'),
    );
  }

  // Obyektni JSONga o‘girish
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'senderId': senderId,
      'receiverId': receiverId,
      'message': message,
      'timestamp': timestamp,
      'isMe': isMe,
      'type': type.toString().split('.').last,
    };
  }
}

enum MessageType {
  text,
  image,
  audio,
  video,
}

class ChatModel {
  final int? id;
  final String? name;
  final String? avatar;
  List<MessageModel>? messages = [];

  ChatModel({
    this.id,
    this.name,
    this.avatar,
    this.messages,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      id: json['id'],
      name: json['name'],
      avatar: json['avatar'],
      messages: List<MessageModel>.from(json['messages'].map((x) => MessageModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'avatar': avatar,
      'messages': messages?.map((x) => x.toJson()).toList(),
    };
  }
}














