import 'package:flutter/material.dart';

class SearchDialog extends StatefulWidget {
  final String currentSearch;

  SearchDialog({this.currentSearch});

  @override
  _SearchDialogState createState() => _SearchDialogState(currentSearch);
}

class _SearchDialogState extends State<SearchDialog> {
  final TextEditingController _controller;

  _SearchDialogState(String currentSearch)
      : _controller = TextEditingController(text: currentSearch);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          left: 2,
          top: 2,
          right: 2,
          child: Card(
            child: TextField(
              controller: _controller,
              autofocus: true,
              textInputAction: TextInputAction.search,
              onSubmitted: (value) {
                Navigator.of(context).pop(value);
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
                border: InputBorder.none,
                prefixIcon: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.grey[700],
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.close),
                  color: Colors.grey[700],
                  onPressed: () {
                    _controller.clear();
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
