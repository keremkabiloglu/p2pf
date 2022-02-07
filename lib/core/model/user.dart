import 'dart:convert';

import 'package:flutter_application_1/core/model/message.dart';

class User {
  int? id;
  String? name;
  String? avatar;
  String? token;
  List<Message> messageList = [];

  User({this.id, this.name, this.avatar, this.token});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'avatar': avatar,
      'token': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id']?.toInt(),
      name: map['name'],
      avatar: map['avatar'],
      token: map['token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(jsonDecode(source));
}
