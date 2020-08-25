import 'package:flutter/material.dart';
import 'package:olx_clone/base_navigation/widgets/custom_drawer.dart';
import 'package:olx_clone/home/bloc/home_bloc.dart';
import 'package:olx_clone/home/widgets/search_dialog.dart';
import 'package:olx_clone/home/widgets/top_bar.dart';
import 'package:provider/provider.dart';

class HomeScrenn extends StatefulWidget {
  @override
  _HomeScrennState createState() => _HomeScrennState();
}

class _HomeScrennState extends State<HomeScrenn> {
  HomeBloc _homeBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final homeBloc = Provider.of<HomeBloc>(context);
    if (homeBloc != _homeBloc) {
      _homeBloc = homeBloc;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: StreamBuilder<String>(
          stream: _homeBloc.outSearch,
          initialData: "OLX Clone",
          builder: (context, snapshot) {
            if (snapshot.data.isEmpty) {
              return Container();
            } else {
              return GestureDetector(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      width: constraints.biggest.width,
                      child: Text(snapshot.data),
                    );
                  },
                ),
                onTap: () => openSearch(snapshot.data),
              );
            }
          },
        ),
        actions: <Widget>[
          StreamBuilder<String>(
            stream: _homeBloc.outSearch,
            initialData: "",
            builder: (context, snapshot) {
              if (snapshot.data.isEmpty) {
                return IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    openSearch("");
                  },
                );
              } else {
                return IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    _homeBloc.setSearch("");
                  },
                );
              }
            },
          )
        ],
      ),
      drawer: CustomDrawer(),
      body: Column(
        children: <Widget>[
          TopBar(),
        ],
      ),
    );
  }

  void openSearch(String currentSearch) async {
    final String search = await showDialog(
      context: context,
      builder: (context) => SearchDialog(currentSearch: currentSearch),
    );

    if (search != null) {
      _homeBloc.setSearch(search);
    }
  }
}
