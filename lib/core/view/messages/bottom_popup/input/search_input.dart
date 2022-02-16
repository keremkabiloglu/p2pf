import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  final Function(String?)? onChanged;
  const SearchInput({Key? key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.075,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          onChanged: onChanged,
          maxLines: 1,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.075 / 3),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            counterText: '',
            prefixIcon: const Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
