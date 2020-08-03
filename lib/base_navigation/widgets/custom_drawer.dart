import 'package:flutter/material.dart';
import 'package:olx_clone/base_navigation/widgets/custom_header.dart';
import 'package:olx_clone/base_navigation/widgets/menu_section.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          CustomHeader(),
          MenuSection(),
          Divider(color: Colors.grey[400]),
        ],
      ),
    );
  }
}
