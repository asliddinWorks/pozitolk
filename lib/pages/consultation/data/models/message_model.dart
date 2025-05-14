// class MessageModel {
//   final int? id;
//   final int? senderId;
//   final int? receiverId;
//   final String message;
//   final String? timestamp;
//   final bool isMe; // foydalanuvchi o'zi yuborganmi yoki yo'qmi
//   final MessageType? type;
//
//   MessageModel({
//     this.id,
//     this.senderId,
//     this.receiverId,
//     required this.message,
//     this.timestamp,
//     required this.isMe,
//     this.type,
//   });
//
//   // JSONdan obyektga o‘girish
//   factory MessageModel.fromJson(Map<String, dynamic> json) {
//     return MessageModel(
//       id: json['id'],
//       senderId: json['senderId'],
//       receiverId: json['receiverId'],
//       message: json['message'],
//       timestamp: json['timestamp'],
//       isMe: json['isMe'],
//       type: MessageType.values.firstWhere((e) => e.toString() == 'MessageType.${json['type']}'),
//     );
//   }
//
//   // Obyektni JSONga o‘girish
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'senderId': senderId,
//       'receiverId': receiverId,
//       'message': message,
//       'timestamp': timestamp,
//       'isMe': isMe,
//       'type': type.toString().split('.').last,
//     };
//   }
// }

enum MessageType {
  text,
  image,
  audio,
  video,
}

class ChatModel {
  final int? id;
  final String? clientNickname;
  final String? clientAvatar;
  final MessageModel? lastMessage;

  ChatModel({
     this.id,
     this.clientNickname,
     this.clientAvatar,
     this.lastMessage,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      id: json['id'],
      clientNickname: json['client_nickname'],
      clientAvatar: json['client_avatar'],
      lastMessage: MessageModel.fromJson(json['last_message'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'client_nickname': clientNickname,
      'client_avatar': clientAvatar,
      'last_message': lastMessage?.toJson(),
    };
  }
}

class MessageModel {
  final int? id;
  final int? sender;
  final String? text;
  final DateTime? createdAt;

  MessageModel({
    this.id,
    this.sender,
    this.text,
    this.createdAt,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'],
      sender: json['sender'],
      text: json['text'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
    );
  }
  factory MessageModel.fromJson2(Map<String, dynamic> json) {
    return MessageModel(
      id: 0,
      sender: json['id'],
      text: json['text'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      // 'id': id,
      // 'sender': sender,
      'text': text,
      // 'created_at': createdAt.toString(),
    };
  }
}



class SlotModel {
  final String key;
  final DateTime date;
  final String hour;
  bool isChecked;
  bool isSelected;  // Yangi xususiyat

  SlotModel({
    required this.key,
    required this.date,
    required this.hour,
    this.isChecked = false,
    this.isSelected = false,  // Default qiymat false
  });
}











