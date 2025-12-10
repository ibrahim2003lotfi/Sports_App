class NewsModel {
  final String id;
  final String title;
  final String description;
  final String sport;
  final String? team;
  final String? player;
  final String? imageUrl;
  final DateTime createdAt;

  NewsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.sport,
    required this.createdAt,
    this.team,
    this.player,
    this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "sport": sport,
      "team": team,
      "player": player,
      "imageUrl": imageUrl,
      "createdAt": createdAt.toIso8601String(),
    };
  }

  factory NewsModel.fromMap(Map<String, dynamic> map) {
    return NewsModel(
      id: map["id"],
      title: map["title"],
      description: map["description"],
      sport: map["sport"],
      team: map["team"],
      player: map["player"],
      imageUrl: map["imageUrl"],
      createdAt: DateTime.parse(map["createdAt"]),
    );
  }
}
