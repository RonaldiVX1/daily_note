class Note {
  final int? id;
  final String title;
  final String description;
  final DateTime reminderTime;

  Note({
    this.id,
    required this.title,
    required this.description,
    required this.reminderTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'reminderTime': reminderTime.toIso8601String(),
    };
  }

  static Note fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      reminderTime: DateTime.parse(map['reminderTime']),
    );
  }
}
