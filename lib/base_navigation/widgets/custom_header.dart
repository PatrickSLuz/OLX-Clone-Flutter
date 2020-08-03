import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 40, 0, 40),
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Icon(Icons.person_pin, color: Colors.white, size: 30),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Acesse sua conta agora!",
                overflow: TextOverflow.clip,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "Clique aqui!",
                overflow: TextOverflow.clip,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
