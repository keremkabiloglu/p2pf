import 'package:socket_io_client/socket_io_client.dart';

import 'socket_settings.dart';

class SocketService {
  final Socket _socket = io(
    SocketSettings.url.value + SocketSettings.port.value,
    OptionBuilder().setTransports(['websocket']).disableAutoConnect().build(),
  );

  Future<bool> connectServer() async {
    if (_socket.connected) return true;
    _socket.connect();
    for (int i = 0; i < SocketSettings.timeOut.value; i++) {
      if (_socket.connected) {
        break;
      }
      await Future.delayed(const Duration(seconds: 1));
    }
    return _socket.connected;
  }

  Future<bool> send(String event, dynamic data) async {
    if (await connectServer()) {
      _socket.emit(event, data);
      return true;
    }
    return false;
  }

  Future<bool> listen(String event, dynamic Function(dynamic) handler) async {
    if (await connectServer()) {
      _socket.on(event, handler);
      return true;
    }
    return false;
  }

  void clearListeners() {
    _socket.clearListeners();
  }
}
