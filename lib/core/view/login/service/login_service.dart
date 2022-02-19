import 'dart:convert';

import 'package:crypto/crypto.dart';

import '../../../data/server/socket_service.dart';

class LoginService extends SocketService {
  static const String _registerEvent = 'register:send';
  static const String _registerResponse = 'register:response';
  static const String _loginEvent = 'login:send';
  static const String _loginResponse = 'login:response';

  void clear() {
    clearListeners();
  }

  Future<bool> emitRegister({
    required String name,
    required String email,
    required String password,
  }) async {
    return await send(_registerEvent, {
      'name': name,
      'email': email,
      'password': sha256.convert(utf8.encode(password)).toString(),
    });
  }

  Future<bool> listenRegister(dynamic Function(dynamic) handler) async {
    return await listen(_registerResponse, handler);
  }

  Future<bool> emitLogin({
    required String email,
    required String password,
  }) async {
    return await send(_loginEvent, {
      'email': email,
      'password': sha256.convert(utf8.encode(password)).toString(),
    });
  }

  Future<bool> listenLogin(dynamic Function(dynamic) handler) async {
    return await listen(_loginResponse, handler);
  }
}
