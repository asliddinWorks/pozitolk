
class ClientModel {
  final String? nickname;
  final String? avatarUrl;
  final int? sessionCount;
  final DateTime? lastSessionDate;
  final DateTime? futureSessionDate;
  final int? age;
  final ClientTopics? topics;

  ClientModel({
    this.nickname,
    this.avatarUrl,
    this.sessionCount,
    this.lastSessionDate,
    this.futureSessionDate,
    this.age,
    this.topics,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
      nickname: json['client_nickname'] as String?,
      avatarUrl: json['client_avatar'] as String?,
      sessionCount: json['session_count'] as int?,
      lastSessionDate: json['last_session_date'] != null
          ? DateTime.tryParse(json['last_session_date'])
          : null,
      futureSessionDate: json['future_session_date'] != null
          ? DateTime.tryParse(json['future_session_date'])
          : null,
      age: json['client_age'] as int?,
      topics: json['topics'] != null
          ? ClientTopics.fromJson(json['topics'])
          : null,
    );
  }
}

class ClientTopics {
  final List<String>? feeling;
  final List<String>? relation;
  final List<String>? workStudy;
  final List<String>? lifeEvent;
  final List<String>? coupleTherapy;

  ClientTopics({
    this.feeling,
    this.relation,
    this.workStudy,
    this.lifeEvent,
    this.coupleTherapy,
  });

  factory ClientTopics.fromJson(Map<String, dynamic> json) {
    return ClientTopics(
      feeling: (json['feeling'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList(),
      relation: (json['relation'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList(),
      workStudy: (json['work_study'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList(),
      lifeEvent: (json['life_event'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList(),
      coupleTherapy: (json['couple_therapy'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList(),
    );
  }
}
