part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState._({
    this.status = LoginStatus.unknown,
    this.error = "",
    this.checkbox = false,
  });

  const LoginState.unknown() : this._();

  const LoginState.success()
      : this._(status: LoginStatus.success);

  const LoginState.failure()
      : this._(status: LoginStatus.failure, error: "Please enter username and password");

  LoginState copyWith({
    LoginStatus? status,
    String? error,
    bool? checkbox,
  }) {
    return LoginState._(
      status: status ?? this.status,
      error: error ?? this.error,
      checkbox: checkbox ?? this.checkbox,
    );
  }

  final LoginStatus status;
  final String error;
  final bool checkbox;

  @override
  List<Object> get props => [status, error, checkbox];

}
