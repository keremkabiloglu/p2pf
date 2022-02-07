import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/core/data/service/socket_settings.dart';
import 'package:socket_io_client/socket_io_client.dart';

class SocketService with ChangeNotifier {
  final Socket _socket = io(
    SocketSettings.url.value + SocketSettings.port.value,
    OptionBuilder().setTransports(['websocket']).disableAutoConnect().build(),
  );

  final VoidCallback? registeredEmit;

  SocketService({this.registeredEmit});

  Future<bool> connectServer() async {
    _socket.connect();
    for (int i = 0; i < SocketSettings.timeOut.value; i++) {
      if (_socket.connected) {
        _socket.on(
            SocketSettings.registerAnEmit.value, (data) => registeredEmit);
      }
      await Future.delayed(const Duration(seconds: 1));
    }
    return _socket.connected;
  }
}
