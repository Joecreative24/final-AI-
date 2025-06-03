class DailyGoal {
  final String id;
  final String title;
  final String description;
  final int targetValue;
  final int currentValue;
  final String unit;
  final DateTime date;
  final bool isCompleted;
  
  DailyGoal({
    required this.id,
    required this.title,
    required this.description,
    required this.targetValue,
    this.currentValue = 0,
    this.unit = 'minutes',
    required this.date,
    this.isCompleted = false,
  });
  
  double get progress => targetValue > 0 ? (currentValue / targetValue).clamp(0.0, 1.0) : 0.0;
  
  factory DailyGoal.fromJson(Map<String, dynamic> json) {
    return DailyGoal(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      targetValue: json['targetValue'] ?? 0,
      currentValue: json['currentValue'] ?? 0,
      unit: json['unit'] ?? 'minutes',
      date: DateTime.parse(json['date'] ?? DateTime.now().toIso8601String()),
      isCompleted: json['isCompleted'] ?? false,
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'targetValue': targetValue,
      'currentValue': currentValue,
      'unit': unit,
      'date': date.toIso8601String(),
      'isCompleted': isCompleted,
    };
  }
}