import '../../../data/local/sql.dart';
import '../../../model/room.dart';

class RoomService {
  final SQL _sql = SQL();

  Future<List<Room>> getAllRooms() async {
    return await _sql.getAllRooms();
  }
}
