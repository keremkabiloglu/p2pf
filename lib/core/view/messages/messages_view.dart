import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'messages_view_model.dart';

class MessagesView extends MessagesViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: buildAppBar(),
        body: buildBody(),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text('messages').tr(),
      centerTitle: true,
      actions: buildActions,
    );
  }

  List<Widget> get buildActions {
    return [
      IconButton(
        onPressed: onClickNotifications,
        icon: const Icon(CupertinoIcons.heart),
      ),
      IconButton(
        onPressed: onClickNewRoom,
        icon: const Icon(Icons.add),
      )
    ];
  }

  Widget buildBody() {
    return loading
        ? buildLoading()
        : rooms.isEmpty
            ? buildEmpty()
            : buildListView();
  }

  Center buildLoading() => const Center(child: CircularProgressIndicator());

  Center buildEmpty() => Center(child: const Text('emptyMessageList').tr());

  ListView buildListView() {
    return ListView.builder(
      itemCount: rooms.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(rooms[index].id.toString()),
        );
      },
    );
  }
}
