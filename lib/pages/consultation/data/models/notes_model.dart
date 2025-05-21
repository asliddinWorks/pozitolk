class NotesModel {
  final int id;
  final DateTime? date;
  final String text;

  NotesModel({
    required this.id,
    this.date,
    required this.text,
  });

  factory NotesModel.fromJson(Map<String, dynamic> json) {
    return NotesModel(
      id: json['id'],
      // date: json['date'] != null ? DateTime.parse(json['date']) : null,
      text: json['text'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'client_id': id,
      // 'date': date?.toIso8601String(),
      'text': text,
    };
  }
}
