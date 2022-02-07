import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/data/local/shared_pref.dart';
import 'package:flutter_application_1/core/model/user.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'client_extension.dart';

class ClientService with ChangeNotifier {
  final SharedPref _sharedPref = SharedPref();
  User? loggedUser;

  final Socket socket = io(
      Server.url.string + ':' + Server.port.string,
      OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .build());

  
  //Connect Server
  Future<bool> connectServer({required int timeOutSeconds}) async {
    socket.connect();
    for (var i = 0; i < timeOutSeconds * 2; i++) {
      await Future.delayed(const Duration(milliseconds: 500));
      if (socket.connected) {
        socket.on(Server.getAuthResponse.string, handleAuthResponse);
        return true;
      }
    }
    return false;
  }

  //Handle Auth Response
  void handleAuthResponse(data) {
    if (data['response'] == 'true') {
      _setupUser(User.fromJson(jsonEncode(data['user'][0])));
    } else {
      _sharedPref.logOutUser();
    }
  }

  //Check User From Server
  Future<bool> checkUser() async {
    if (await connectServer(timeOutSeconds: 5)) {
      socket.emit(Server.emitAuthToken.string, await SharedPref().getUserToken);
      return true;
    }

    return false;
  }

  //Setup User
  Future<bool> _setupUser(User user) async {
    loggedUser = user;
    SharedPref().saveUserToken(loggedUser?.token ?? '');
    notifyListeners();
    return true;
  }
}
