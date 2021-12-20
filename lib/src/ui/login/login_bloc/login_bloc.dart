import 'dart:async';
import 'package:vision/src/ui/login/login_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc()
      : _loginRepository = LoginRepository(),
        super(const LoginState.unknown()) {
    on<RememberMeCheckboxChanged>(_onCheckBoxChanged);
    on<LoginSubmitted>(_onSubmitted);
    on<LoginStatusChanged>(_onLoginStatusChanged);
    _loginStatusSubscription = _loginRepository.status.listen(
      (status) => add(LoginStatusChanged(status)),
    );
  }

  final LoginRepository _loginRepository;
  late StreamSubscription<LoginStatus> _loginStatusSubscription;

  @override
  Future<void> close() {
    _loginStatusSubscription.cancel();
    _loginRepository.dispose();
    return super.close();
  }

  void _onCheckBoxChanged(
    RememberMeCheckboxChanged event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(
      checkbox: event.checked,
    ));
  }

  void _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    try {
      await _loginRepository.logIn(
        username: event.username,
        password: event.password,
      );
    } catch (_) {}
  }

  void _onLoginStatusChanged(
    LoginStatusChanged event,
    Emitter<LoginState> emit,
  ) async {
    switch (event.status) {
      case LoginStatus.failure:
        return emit(LoginState.failure());
      case LoginStatus.success:
        return emit(LoginState.success());
      default:
        return emit(LoginState.unknown());
    }
  }
}
