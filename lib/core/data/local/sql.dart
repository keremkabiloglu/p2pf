import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/core/model/message.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Sql {
  final String _dataBase = 'database.db';
  final String _messagesTable = 'messages_t';
  Database? database;

  Future<void> initDatabase() async {
    if (database == null) {
      String path = join(await getDatabasesPath(), _dataBase);

      database = await openDatabase(path,
          version: 1,
          onCreate: (Database db, int version) =>
              debugPrint('Database initalized'));
    }
  }

  Future<void> createMessagesTable() async {
    if (database == null) {
      await initDatabase();
    }
    await database!.execute(
        'CREATE TABLE $_messagesTable IF NOT EXIST (id INTEGER PRIMARY KEY, sender INTEGER, dateTime TEXT, content TEXT, readed TEXT)');
    debugPrint('Table created : $_messagesTable');
  }

  Future<void> insertMessage({required Message message}) async {
    if (database == null) await initDatabase();
    await database!.transaction((txn) async {
      int id = await txn.rawInsert(
          'INSERT INTO $_messagesTable (sender, dateTime, content, readed) VALUES (${message.sender}, ${message.dateTime.toString()}, ${message.content}, ${message.readed.toString()})');
      debugPrint('Message added to $_messagesTable : ${id.toString()}');
    });
  }

  Future<void> updateMessage(
      {required int messageId, required Message message}) async {
    if (database == null) await initDatabase();

    await database!.rawUpdate(
        'UPDATE $_messagesTable SET sender = ?, dateTime = ?, content = ?, readed = ? WHERE id = ?',
        [
          message.sender,
          '${message.dateTime}',
          '${message.content}'
              '${message.readed}',
          '$messageId'
        ]);

    debugPrint('Message updated in $_messagesTable : ${message.id}');
  }

  Future<Message?> getMessageWithID(int messageId) async {
    if (database == null) await initDatabase();
    List<Map> map = await database!
        .rawQuery('SELECT * FROM $_messagesTable WHERE id = $messageId');
    for (var element in map) {
      return Message.fromMap(element);
    }
    return null;
  }

  Future<List<Message>> getAllMessages() async {
    if (database == null) initDatabase();
    List<Message> messages = [];
    List<Map> map = await database!.rawQuery('SELECT * FROM $_messagesTable');
    for (var element in map) {
      messages.add(Message.fromMap(element));
      debugPrint('Message got from $_messagesTable id: $element[id]}');
    }
    return messages;
  }
}
