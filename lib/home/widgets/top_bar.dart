import 'package:flutter/material.dart';
import 'package:olx_clone/filter/view/filter_screen.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey[400],
            blurRadius: 15,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Row(
        children: <Widget>[
          _buildButton(
            label: 'Categorias',
            boxDecoration: BoxDecoration(color: Colors.white),
            onPressed: () {},
          ),
          _buildButton(
            label: 'Filtros',
            boxDecoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                left: BorderSide(color: Colors.grey[400]),
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => FilterScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    String label,
    BoxDecoration boxDecoration,
    VoidCallback onPressed,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 50,
          decoration: boxDecoration,
          child: Text(
            label,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
