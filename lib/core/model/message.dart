import 'dart:convert';

class Message {
  int? id;
  int? sender;
  String? dateTime;
  String? content;
  List<int>? readed;

  Message({this.id, this.sender, this.dateTime, this.content, this.readed});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sender': sender,
      'dateTime': dateTime,
      'content': content,
      'readed': readed,
    };
  }

  factory Message.fromMap(Map<dynamic, dynamic> map) {
    return Message(
      id: map['id']?.toInt(),
      sender: map['sender']?.toInt(),
      dateTime: map['dateTime'],
      content: map['content'],
      readed: List<int>.from(map['readed']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) =>
      Message.fromMap(json.decode(source));
}
