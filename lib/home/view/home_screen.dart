import 'package:flutter/material.dart';
import 'package:olx_clone/base_navigation/widgets/custom_drawer.dart';

class HomeScrenn extends StatefulWidget {
  @override
  _HomeScrennState createState() => _HomeScrennState();
}

class _HomeScrennState extends State<HomeScrenn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OLX Clone"),
      ),
      drawer: CustomDrawer(),
    );
  }
}
