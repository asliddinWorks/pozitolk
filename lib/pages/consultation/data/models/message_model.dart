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



// class SlotModel {
//   final String key;
//   final DateTime date;
//   final String hour;
//   bool isChecked;
//   bool isSelected;  // Yangi xususiyat
//
//   SlotModel({
//     required this.key,
//     required this.date,
//     required this.hour,
//     this.isChecked = false,
//     this.isSelected = false,  // Default qiymat false
//   });
// }


class SlotModel {
  final int? slotId;
  final String? dayOfWeek;
  final int? dayOfWeekIndex;
  final String? time;
  final DateTime? datetime;
  final String? status;
  final int? sessionId;
  final int? clientId;
  final String? clientName;
  bool? isChecked = false;
  bool? isSelected = false;

  SlotModel({
    this.slotId,
    this.dayOfWeek,
    this.dayOfWeekIndex,
    this.time,
    this.datetime,
    this.status,
    this.sessionId,
    this.clientId,
    this.clientName,
    this.isChecked ,
    this.isSelected,
  });

  factory SlotModel.fromJson(Map<String, dynamic> json) {
    return SlotModel(
      slotId: json['slot_id'],
      dayOfWeek: json['day_of_week'],
      dayOfWeekIndex: json['day_of_week_index'],
      time: json['time'],
      datetime: DateTime.parse(json['datetime']),
      status: json['status'],
      sessionId: json['session_id'],
      clientId: json['client_id'],
      clientName: json['client_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'slot_id': slotId,
      'day_of_week': dayOfWeek,
      'day_of_week_index': dayOfWeekIndex,
      'time': time,
      'datetime': datetime?.toIso8601String(),
      'status': status,
      'session_id': sessionId,
      'client_id': clientId,
      'client_name': clientName,
    };
  }
}


class ScheduleModel {
  final int clientId;
  final String clientName;
  final int id;
  final DateTime startTime;
  final DateTime endTime;
  final String time;
  final String dayOfWeek;
  final int dayOfWeekIndex;

  ScheduleModel({
    required this.clientId,
    required this.clientName,
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.time,
    required this.dayOfWeek,
    required this.dayOfWeekIndex,
  });

  factory ScheduleModel.fromJson(Map<String, dynamic> json) {
    return ScheduleModel(
      clientId: json['client_id'],
      clientName: json['client_name'],
      id: json['id'],
      startTime: DateTime.parse(json['start_time']),
      endTime: DateTime.parse(json['end_time']),
      time: json['time'],
      dayOfWeek: json['day_of_week'],
      dayOfWeekIndex: json['day_of_week_index'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'client_id': clientId,
      'client_name': clientName,
      'id': id,
      'start_time': startTime.toIso8601String(),
      'end_time': endTime.toIso8601String(),
      'time': time,
      'day_of_week': dayOfWeek,
      'day_of_week_index': dayOfWeekIndex,
    };
  }
}










