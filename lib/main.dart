import 'package:flutter/material.dart';
import 'package:olx_clone/base_navigation/view/base_screen.dart';
import 'package:olx_clone/base_navigation/bloc/drawer_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DrawerBloc>(
          create: (context) => DrawerBloc(),
          dispose: (context, value) => value.dispose(),
        )
      ],
      child: MaterialApp(
        title: 'OLX Clone',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: BaseScreen(),
      ),
    );
  }
}
