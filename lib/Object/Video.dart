class Video {
  final String id;
  final String name;
  final String key;
  final String type;

  const Video(
      {required this.id,
      required this.name,
      required this.key,
      required this.type});

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json['id'] as String,
      name: json['name'] as String,
      key: json['key'] as String,
      type: json['type'] as String,
    );
  }
}
