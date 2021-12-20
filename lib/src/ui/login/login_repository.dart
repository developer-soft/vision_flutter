import 'dart:async';

enum LoginStatus { unknown, success, failure }

class LoginRepository {
  final _controller = StreamController<LoginStatus>();

  Stream<LoginStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield LoginStatus.unknown;
    yield* _controller.stream;
  }

  Future<void> logIn({
    required String username,
    required String password,
  }) async {
    await Future.delayed(
      const Duration(milliseconds: 300),
          () => (username.isNotEmpty && password.isNotEmpty) ? _controller.add(LoginStatus.success) : _controller.add(LoginStatus.failure),
    );
  }

  void logOut() {
    _controller.add(LoginStatus.failure);
  }

  void dispose() => _controller.close();
}
