import 'package:vision/utils/all_imports.dart';
import 'package:flutter/cupertino.dart';


class LoginScreen extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => LoginScreen());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vision')),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 40),
        child: RepositoryProvider.value(
          value: null,
          child: BlocProvider(
            create: (_) => LoginBloc(),
            child: LoginForm(),
          ),
        ),
      ),
    );
  }
}
