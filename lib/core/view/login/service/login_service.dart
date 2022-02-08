import 'package:flutter_application_1/core/data/service/socket_service.dart';

class LoginService extends SocketService {
  Future<void> emitRegister({
    required String name,
    required String email,
    required String password,
  }) async {
    await send('easy', {
      'name': name,
      'email': email,
      'password': password,
    });
  }

  Future<void> listenRegister(dynamic Function(dynamic) handler) async {
    listen('easy:response', handler);
  }
}
