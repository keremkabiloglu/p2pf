import 'dart:convert';

enum Type { single, group }

class Room {
  int? id;
  Type? type;
  List<int>? contacts;
  String? title;

  Room({
    this.id,
    this.type,
    this.contacts,
    this.title,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type == Type.single ? 0 : 1,
      'contacts': contacts,
      'title': title,
    };
  }

  factory Room.fromMap(Map<dynamic, dynamic> map) {
    return Room(
      id: map['id']?.toInt(),
      type: map['type'] == 0 ? Type.single : Type.group,
      contacts: List<int>.from(map['contacts']),
      title: map['title'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Room.fromJson(String source) => Room.fromMap(json.decode(source));
}
