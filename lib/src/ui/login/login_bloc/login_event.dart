part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class RememberMeCheckboxChanged extends LoginEvent {
  const RememberMeCheckboxChanged(this.checked);

  final bool checked;

  @override
  List<Object> get props => [checked];
}

class LoginSubmitted extends LoginEvent {
  const LoginSubmitted(this.username, this.password);

  final String username;
  final String password;

  @override
  List<Object> get props => [username, password];
}

class LoginStatusChanged extends LoginEvent {
  const LoginStatusChanged(this.status);

  final LoginStatus status;

  @override
  List<Object> get props => [status];
}