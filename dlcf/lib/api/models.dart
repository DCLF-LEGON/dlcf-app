// ignore_for_file: non_constant_identifier_names

class YoutubeMessage {
  final int id;
  final String title;
  final String video_id;
  final String thumbnailUrl;
  final String description;

  YoutubeMessage({
    required this.id,
    required this.title,
    required this.video_id,
    required this.thumbnailUrl,
    required this.description,
  });

  factory YoutubeMessage.fromMap(Map<String, dynamic> map) {
    return YoutubeMessage(
      id: map['id'],
      title: map['title'],
      video_id: map['video_id'],
      thumbnailUrl: map['thumbnailUrl'],
      description: map['description'],
    );
  }
}

// channels
class Channel {
  final int id;
  final String name;
  final String description;
  final String thumbnailUrl;

  Channel({
    required this.id,
    required this.name,
    required this.description,
    required this.thumbnailUrl,
  });

  factory Channel.fromMap(Map<String, dynamic> map) {
    return Channel(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      thumbnailUrl: map['thumbnailUrl'],
    );
  }
}

// doctrine
class Doctrine {
  final int id;
  final String title;
  final String brief;
  final String body;

  Doctrine({
    required this.id,
    required this.title,
    required this.brief,
    required this.body,
  });

  factory Doctrine.fromMap(Map<String, dynamic> map) {
    return Doctrine(
      id: map['id'],
      title: map['title'],
      brief: map['brief'],
      body: map['body'],
    );
  }
}

// Message
class Message {
  final int id;
  final String title;
  final String preacher;
  final String url;
  final String description;
  final String thumbnailUrl;

  Message({
    required this.id,
    required this.title,
    required this.preacher,
    required this.url,
    required this.description,
    required this.thumbnailUrl,
  });

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      id: map['id'],
      title: map['title'],
      preacher: map['preacher'],
      url: map['url'],
      description: map['description'],
      thumbnailUrl: map['thumbnailUrl'],
    );
  }
}
