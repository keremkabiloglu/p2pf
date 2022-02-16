import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:p2pf/core/view/messages/bottom_popup/input/search_input.dart';
import './bottom_popup_view_model.dart';

class BottomPopupView extends BottomPopupViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            buildDivider(context),
            const SearchInput(),
            Expanded(
              child: buildListView(),
            ),
          ],
        ),
      ),
    );
  }

  ListView buildListView() => ListView.builder(
      itemCount: contacts.isNotEmpty ? contacts.length : 1,
      itemBuilder: (BuildContext context, int index) => contacts.isEmpty
          ? ListTile(
              title: const Text(
                'emptyContact',
                textAlign: TextAlign.center,
              ).tr(),
            )
          : ListTile(
              leading: const CircleAvatar(
                backgroundImage: NetworkImage('https://picsum.photos/200/300'),
              ),
              title: const Text('Ahmet'),
              subtitle: const Text('@akeremkabiloglu'),
              trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.bubble_left_bubble_right)),
            ));

  Padding buildDivider(BuildContext context) => Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Divider(
          color: Colors.black12,
          height: 20,
          thickness: 5,
          indent: MediaQuery.of(context).size.width * 0.2,
          endIndent: MediaQuery.of(context).size.width * 0.2,
        ),
      );
}
