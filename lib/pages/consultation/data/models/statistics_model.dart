class StatisticsModel {
  final int allTimeSessions;
  final int totalClients;
  final int activeClients;
  final DateTime onPozitalkSince;
  final int totalExperience;
  final List<MonthlySession> lastYearSessions;
  final int lastYearSessionsCount;
  final AverageSessionDuration avgDuration;
  final List<SessionDynamic> sessionDynamics; // <-- dynamic emas!

  StatisticsModel({
    required this.allTimeSessions,
    required this.totalClients,
    required this.activeClients,
    required this.onPozitalkSince,
    required this.totalExperience,
    required this.lastYearSessions,
    required this.lastYearSessionsCount,
    required this.avgDuration,
    required this.sessionDynamics,
  });

  factory StatisticsModel.fromJson(Map<String, dynamic> json) {
    return StatisticsModel(
      allTimeSessions: json['all_time_sessions'],
      totalClients: json['total_clients'],
      activeClients: json['active_clients'],
      onPozitalkSince: DateTime.parse(json['on_pozitalk_since']),
      totalExperience: json['total_experience'],
      lastYearSessions: (json['last_year_sessions'] as List)
          .map((e) => MonthlySession.fromJson(e))
          .toList(),
      lastYearSessionsCount: json['last_year_sessions_count'],
      avgDuration: AverageSessionDuration.fromJson(json['avg_duration']),
      sessionDynamics: (json['dynamic'] as List)
          .map((e) => SessionDynamic.fromJson(e))
          .toList(),
    );
  }
}

class MonthlySession {
  final String month;
  final int total;

  MonthlySession({
    required this.month,
    required this.total,
  });

  factory MonthlySession.fromJson(Map<String, dynamic> json) {
    return MonthlySession(
      month: json['month'],
      total: json['total'],
    );
  }
}

class AverageSessionDuration {
  final int averageSessions;
  final int longestSessions;

  AverageSessionDuration({
    required this.averageSessions,
    required this.longestSessions,
  });

  factory AverageSessionDuration.fromJson(Map<String, dynamic> json) {
    return AverageSessionDuration(
      averageSessions: json['average_sessions'],
      longestSessions: json['longest_sessions'],
    );
  }
}

class SessionDynamic {
  final int sessions;
  final int clients;
  final String diff;

  SessionDynamic({
    required this.sessions,
    required this.clients,
    required this.diff,
  });

  factory SessionDynamic.fromJson(Map<String, dynamic> json) {
    return SessionDynamic(
      sessions: json['sessions'],
      clients: json['clients'],
      diff: json['diff'] ?? '',
    );
  }
}
