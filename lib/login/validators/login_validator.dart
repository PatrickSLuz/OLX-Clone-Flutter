import 'dart:async';

import 'package:olx_clone/login/model/field_state.dart';

class LoginValidator {
  final emailValidator = StreamTransformer<String, FieldState>.fromHandlers(
    handleData: (data, sink) {
      const Pattern pattern =
          r"^(([^<>()[\]\\.,;:\s@\']+(\.[^<>()[\]\\.,;:\s@\']+)*)|(\'.+\'))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$";
      final regExp = RegExp(pattern);

      if (data.isEmpty) {
        sink.add(
          FieldState(error: "Campo obrigatório"),
        );
      } else if (!regExp.hasMatch(data)) {
        sink.add(
          FieldState(error: "E-mail inválido"),
        );
      } else {
        sink.add(FieldState());
      }
    },
  );

  final passwordValidator = StreamTransformer<String, FieldState>.fromHandlers(
    handleData: (data, sink) {
      if (data.isEmpty) {
        sink.add(
          FieldState(error: "Campo obrigatório"),
        );
      } else {
        sink.add(FieldState());
      }
    },
  );
}
