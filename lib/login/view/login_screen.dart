import 'package:flutter/material.dart';
import 'package:olx_clone/login/bloc/login_bloc.dart';
import 'package:olx_clone/login/model/field_state.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginBloc = LoginBloc();

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
              StreamBuilder<FieldState>(
                stream: _loginBloc.outEmail,
                initialData: FieldState(),
                builder: (context, snapshot) {
                  return TextField(
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    enabled: snapshot.data.enabled,
                    onChanged: _loginBloc.changeEmail,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      errorText: snapshot.data.error,
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
              StreamBuilder<FieldState>(
                stream: _loginBloc.outPassword,
                initialData: FieldState(),
                builder: (context, snapshot) {
                  return TextField(
                    obscureText: true,
                    autocorrect: false,
                    enabled: snapshot.data.enabled,
                    onChanged: _loginBloc.changePassword,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      errorText: snapshot.data.error,
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
