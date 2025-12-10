// نموذج المستخدم لحفظه في Firestore وقراءة بياناته
class UserModel {
  final String uid;
  final String email;
  final String? name;
  final String role; // "user" | "admin" | "superadmin"
  final List<String> sports;
  final List<String> leagues;
  final List<String> teams;
  final List<String> players;
  final bool isDisabled;
  final DateTime createdAt;

  UserModel({
    required this.uid,
    required this.email,
    this.name,
    this.role = 'user',
    List<String>? sports,
    List<String>? leagues,
    List<String>? teams,
    List<String>? players,
    this.isDisabled = false,
    DateTime? createdAt,
  })  : sports = sports ?? [],
        leagues = leagues ?? [],
        teams = teams ?? [],
        players = players ?? [],
        createdAt = createdAt ?? DateTime.now();

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'name': name ?? '',
      'role': role,
      'sports': sports,
      'leagues': leagues,
      'teams': teams,
      'players': players,
      'isDisabled': isDisabled,
      'createdAt': createdAt.toUtc().toIso8601String(),
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] ?? '',
      email: json['email'] ?? '',
      name: json['name'] ?? '',
      role: json['role'] ?? 'user',
      sports: List<String>.from(json['sports'] ?? []),
      leagues: List<String>.from(json['leagues'] ?? []),
      teams: List<String>.from(json['teams'] ?? []),
      players: List<String>.from(json['players'] ?? []),
      isDisabled: json['isDisabled'] ?? false,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
    );
  }
}
