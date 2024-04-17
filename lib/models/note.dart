const String tableNotes = 'notes';

class NoteFields {
  static const String id = 'id';
  static const String isImportant = 'isImportant';
  static const String number = 'number';
  static const String title = 'title';
  static const String description = 'description';
  static const String time = 'time';
}

class Note {
  final int? id;
  final bool isImportant;
  final int number;
  final String title;
  final String description;
  final DateTime time;

  Note(
      {this.id,
      required this.isImportant,
      required this.number,
      required this.title,
      required this.description,
      required this.time});

  Note copy(
      {int? id,
      bool? isImportant,
      int? number,
      String? title,
      String? description,
      DateTime? time}) {
    return Note(
        id: id,
        isImportant: isImportant ?? this.isImportant,
        number: number ?? this.number,
        title: title ?? this.title,
        description: description ?? this.description,
        time: time ?? this.time);
  }

  static Note fromJson(Map<String, Object?> json) {
    return Note(
        id: json[NoteFields.id] as int?,
        isImportant: json[NoteFields.isImportant] == 1,
        number: json[NoteFields.number] as int,
        title: json[NoteFields.title].toString(),
        description: json[NoteFields.description].toString(),
        time: DateTime.parse(json[NoteFields.time] as String));
  }

  Map<String, Object?> toJson() => {
        NoteFields.id: id,
        NoteFields.isImportant: isImportant,
        NoteFields.number: number,
        NoteFields.title: title,
        NoteFields.description: description,
        NoteFields.time: time.toIso8601String(),
      };
}
