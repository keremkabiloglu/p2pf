import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../model/message.dart';
import '../../model/room.dart';

class SQL {
  final String _dataBase = 'database.db';
  final String _messagesTable = 'messages_t';
  final String _roomTable = 'room_t';

  Database? _database;

  Future<void> _initDatabase() async {
    if (_database == null) {
      String path = join(await getDatabasesPath(), _dataBase);

      _database = await openDatabase(path,
          version: 1, onCreate: (Database db, int version) => null);
    }
    await createMessagesTable();
    await createRoomTable();
  }

  Future<void> createMessagesTable() async {
    if (_database == null) await _initDatabase();

    await _database!.execute(
        'CREATE TABLE IF NOT EXISTS $_messagesTable (id INTEGER PRIMARY KEY, sender INTEGER, dateTime TEXT, content TEXT, readed TEXT)');
  }

  Future<void> insertMessage({required Message message}) async {
    if (_database == null) await _initDatabase();
    await _database!.transaction((txn) async {
      int id = await txn.rawInsert(
          'INSERT INTO $_messagesTable (sender, dateTime, content, readed) VALUES (${message.sender}, ${message.dateTime.toString()}, ${message.content}, ${message.readed.toString()})');
    });
  }

  Future<void> updateMessage(
      {required int messageId, required Message message}) async {
    if (_database == null) await _initDatabase();

    await _database!.rawUpdate(
        'UPDATE $_messagesTable SET sender = ?, dateTime = ?, content = ?, readed = ? WHERE id = ?',
        [
          message.sender,
          '${message.dateTime}',
          '${message.content}'
              '${message.readed}',
          '$messageId'
        ]);
  }

  Future<Message?> getMessageWithId(int messageId) async {
    if (_database == null) await _initDatabase();
    List<Map> map = await _database!
        .rawQuery('SELECT * FROM $_messagesTable WHERE id = $messageId');
    for (var element in map) {
      return Message.fromMap(element);
    }
    return null;
  }

  Future<List<Message>> getAllMessages() async {
    if (_database == null) await _initDatabase();
    List<Message> messages = [];
    List<Map> map = await _database!.rawQuery('SELECT * FROM $_messagesTable');
    for (var element in map) {
      messages.add(Message.fromMap(element));
    }
    return messages;
  }

  Future<void> createRoomTable() async {
    if (_database == null) await _initDatabase();

    await _database!.execute(
        'CREATE TABLE IF NOT EXISTS $_roomTable (id INTEGER PRIMARY KEY, tpye INTEGER, contacts TEXT, title TEXT)');
  }

  Future<void> insertRoom({required Room room}) async {
    if (_database == null) await _initDatabase();
    await _database!.transaction((txn) async {
      int id = await txn.rawInsert(
          'INSERT INTO $_roomTable (tpye, contacts, title) VALUES (${room.type == Type.single ? 0 : 1}, ${room.contacts.toString()}, ${room.title}');
    });
  }

  Future<void> updateRoom({required int roomId, required Room room}) async {
    if (_database == null) await _initDatabase();

    await _database!.rawUpdate(
        'UPDATE $_roomTable SET type = ?, contacts = ?, title  = ?', [
      room.type == Type.single ? 0 : 1,
      room.contacts.toString(),
      room.title
    ]);
  }

  Future<Room?> getRoomWithId(int roomId) async {
    if (_database == null) await _initDatabase();
    List<Map> map = await _database!
        .rawQuery('SELECT * FROM $_roomTable WHERE id = $roomId');
    for (var element in map) {
      return Room.fromMap(element);
    }
    return null;
  }

  Future<List<Room>> getAllRooms() async {
    if (_database == null) await _initDatabase();
    List<Room> rooms = [];
    List<Map> map = await _database!.rawQuery('SELECT * FROM $_roomTable');
    for (var element in map) {
      rooms.add(Room.fromMap(element));
    }

    return rooms;
  }
}
