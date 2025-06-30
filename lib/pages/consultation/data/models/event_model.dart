class EventModel {
  final int id;
  final String title;
  final String subtitle;
  final String icon;
  final String slug;
  final String dateCreated;
  final String author;
  final bool isVideo;
  final String body;

  EventModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.slug,
    required this.dateCreated,
    required this.author,
    required this.isVideo,
    required this.body,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'] as int,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      icon: json['icon'] as String,
      slug: json['slug'] as String,
      dateCreated: json['date_created'] as String,
      author: json['author'] as String,
      isVideo: json['is_video'] as bool,
      body: json['body'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'icon': icon,
      'slug': slug,
      'date_created': dateCreated,
      'author': author,
      'is_video': isVideo,
      'body': body,
    };
  }
}


class EventVideoModel {
  final int id;
  final String title;
  final String description;
  final String type;
  final String source;

  EventVideoModel({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.source,
  });

  factory EventVideoModel.fromJson(Map<String, dynamic> json) {
    return EventVideoModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      type: json['type'],
      source: json['source'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'type': type,
      'source': source,
    };
  }
}

