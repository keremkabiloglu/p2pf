import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/data/service/client_service.dart';
import 'package:provider/provider.dart';

import 'home.dart';

abstract class HomeViewModel extends State<Home> {
  String title = 'Home';

  @override
  void initState() {
    super.initState();
    context.read<ClientService>().checkUser();
  }

  Widget getTitle(BuildContext context) {
    return context.watch<ClientService>().loggedUser?.name != null
        ? const Text('Chat App')
        : const CircularProgressIndicator(
            color: Colors.black,
          );
  }

  Widget getBody(BuildContext context) {
    return context.watch<ClientService>().loggedUser?.messageList.isNotEmpty ??
            false
        ? const Center(child: Text('mesajlar...'))
        : context.watch<ClientService>().loggedUser?.messageList.isEmpty ??
                false
            ? const Center(child: Text('Henüz mesajınız yok.'))
            : const Center(child: CircularProgressIndicator());
  }
}
