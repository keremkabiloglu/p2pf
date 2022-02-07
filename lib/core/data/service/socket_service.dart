import 'package:socket_io_client/socket_io_client.dart';

abstract class SocketService {
  static const String _serverUrl = 'http://192.168.1.101';
  static const String _serverPort = ':3030';
  static const int _connectionTimeOutSecond = 10;

  final Socket _socket = io(
    _serverUrl + _serverPort,
    OptionBuilder().setTransports(['websocket']).disableAutoConnect().build(),
  );

  Future<bool> connectServer() async {
    _socket.connect();
    for (int i = 0; i < _connectionTimeOutSecond; i++) {
      if (_socket.connected) break;
      await Future.delayed(const Duration(seconds: 1));
    }
    return _socket.connected;
  }
}
