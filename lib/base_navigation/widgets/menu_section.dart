import 'package:flutter/material.dart';
import 'package:olx_clone/base_navigation/bloc/drawer_bloc.dart';
import 'package:provider/provider.dart';

class MenuSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _drawerBloc = Provider.of<DrawerBloc>(context);

    void _setPage(int page) {
      Navigator.of(context).pop(); // fechar o Drawer
      _drawerBloc.setPage(page);
    }

    return StreamBuilder<int>(
      stream: _drawerBloc.outPage,
      builder: (context, snapshot) {
        return Column(
          children: <Widget>[
            _iconTile(
              label: 'Anúncios',
              icon: Icons.list,
              highlighted: snapshot.data == 0,
              onTap: () {
                _setPage(0);
              },
            ),
            _iconTile(
              label: 'Inserir Anúncio',
              icon: Icons.edit,
              highlighted: snapshot.data == 1,
              onTap: () {
                _setPage(1);
              },
            ),
            _iconTile(
              label: 'Chat',
              icon: Icons.chat,
              highlighted: snapshot.data == 2,
              onTap: () {
                _setPage(2);
              },
            ),
            _iconTile(
              label: 'Favoritos',
              icon: Icons.favorite,
              highlighted: snapshot.data == 3,
              onTap: () {
                _setPage(3);
              },
            ),
            _iconTile(
              label: 'Minha Conta',
              icon: Icons.person,
              highlighted: snapshot.data == 4,
              onTap: () {
                _setPage(4);
              },
            ),
          ],
        );
      },
    );
  }

  Widget _iconTile({
    String label,
    IconData icon,
    VoidCallback onTap,
    bool highlighted,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
      title: Text(
        label,
        style: TextStyle(
          color: highlighted ? Colors.blue : Colors.grey[800],
          letterSpacing: 0.8,
          fontWeight: FontWeight.w600,
        ),
      ),
      leading: Icon(
        icon,
        color: highlighted ? Colors.blue : Colors.grey[800],
      ),
      onTap: onTap,
    );
  }
}
