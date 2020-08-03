import 'dart:async';

import 'package:flutter/material.dart';
import 'package:olx_clone/base_navigation/bloc/drawer_bloc.dart';
import 'package:olx_clone/home/view/home_screen.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final _pageController = PageController();

  DrawerBloc _drawerBloc;
  StreamSubscription _drawerSubscription;

  @override
  void didChangeDependencies() {
    // essa funcao eh chamada em seguida da initState, qnd ja tem um context
    super.didChangeDependencies();

    final DrawerBloc drawerBloc = Provider.of<DrawerBloc>(context);

    if (drawerBloc != _drawerBloc) {
      _drawerBloc = drawerBloc;

      _drawerSubscription?.cancel();
      _drawerSubscription = _drawerBloc.outPage.listen((page) {
        _pageController.jumpToPage(page ?? 0);
      });
    }
  }

  @override
  void dispose() {
    _drawerSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          HomeScrenn(),
          Container(color: Colors.yellow),
          Container(color: Colors.green),
          Container(color: Colors.red),
          Container(color: Colors.purple)
        ],
      ),
    );
  }
}
