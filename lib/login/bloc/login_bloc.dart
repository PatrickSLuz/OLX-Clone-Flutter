import 'package:olx_clone/login/model/field_state.dart';
import 'package:olx_clone/login/validators/login_validator.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with LoginValidator {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Stream<FieldState> get outEmail =>
      _emailController.stream.transform(emailValidator);
  Stream<FieldState> get outPassword =>
      _passwordController.stream.transform(passwordValidator);

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  void dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
