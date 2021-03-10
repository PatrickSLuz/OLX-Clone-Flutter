import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Entrar"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 11),
                child: Text(
                  "Acessar com E-mail:",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3, bottom: 4),
                child: Text(
                  "E-mail",
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              StreamBuilder(
                builder: (context, snapshot) {
                  return TextField(
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      border: const OutlineInputBorder(),
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(3, 26, 3, 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Senha",
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    InkWell(
                      child: Text(
                        "Esqueci minha senha?",
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      onTap: () {
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) => RecoveryScreen(),
                        //   ),
                        // );
                      },
                    ),
                  ],
                ),
              ),
              StreamBuilder(
                builder: (context, snapshot) {
                  return TextField(
                    obscureText: true,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      border: const OutlineInputBorder(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
