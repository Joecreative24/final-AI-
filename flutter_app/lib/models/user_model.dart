class User {
  final String id;
  final String name;
  final String email;
  final String avatar;
  final DateTime joinDate;
  final int totalLearningHours;
  final int completedLessons;
  final Map<String, int> subjectProgress;
  
  User({
    required this.id,
    required this.name,
    required this.email,
    this.avatar = '',
    required this.joinDate,
    this.totalLearningHours = 0,
    this.completedLessons = 0,
    this.subjectProgress = const {},
  });
  
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      name: json['name'] ?? 'User',
      email: json['email'] ?? '',
      avatar: json['avatar'] ?? '',
      joinDate: DateTime.parse(json['joinDate'] ?? DateTime.now().toIso8601String()),
      totalLearningHours: json['totalLearningHours'] ?? 0,
      completedLessons: json['completedLessons'] ?? 0,
      subjectProgress: Map<String, int>.from(json['subjectProgress'] ?? {}),
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'avatar': avatar,
      'joinDate': joinDate.toIso8601String(),
      'totalLearningHours': totalLearningHours,
      'completedLessons': completedLessons,
      'subjectProgress': subjectProgress,
    };
  }
}