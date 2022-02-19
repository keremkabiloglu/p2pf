import 'package:p2pf/core/data/local/sql_service.dart';
import 'package:p2pf/core/model/column_model.dart';

import '../../../model/room.dart';

class RoomService extends SqlService {
  final String _tableName = "room_table";

  RoomService() {
    createTable(name: _tableName, columns: [
      ColumnModel(name: "type", type: ColumnType.int),
      ColumnModel(name: "contacts", type: ColumnType.string),
      ColumnModel(name: "title", type: ColumnType.string),
    ]);
  }

  Future<List<Room>> getAllRooms() async {
    return [];
  }
}
