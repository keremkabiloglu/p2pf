import 'package:flutter/material.dart';

import '../../model/room.dart';
import 'bottom_popup/bottom_popup.dart';
import 'messages.dart';
import 'service/room_service.dart';

abstract class MessagesViewModel extends State<Messages> {
  final RoomService _service = RoomService();
  late final List<Room> rooms = [];
  bool loading = true;
  @override
  void initState() {
    initRooms();
    super.initState();
  }

  Future<void> initRooms() async {
    for (var item in await _service.getAllRooms()) {
      rooms.add(item);
    }
    setState(() {
      loading = false;
    });
  }

  void onClickNewRoom() {
    showModalBottomSheet<dynamic>(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => const BottomPopup());
  }

  void onClickNotifications(){
    
  }
}
