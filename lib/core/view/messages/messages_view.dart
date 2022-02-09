import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'messages_view_model.dart';

class MessagesView extends MessagesViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('messages').tr(),
          ),
          body: Container()),
    );
  }
}
