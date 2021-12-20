import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision/src/ui/login/login_bloc/login_bloc.dart';
import 'package:vision/src/ui/login/login_repository.dart';
import 'package:vision/utils/all_imports.dart';

class LoginForm extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        switch (state.status) {
          case LoginStatus.success:
            Navigator.pushAndRemoveUntil(
                context, DashboardScreen.route(), (route) => false);
            showInSnackBar(context, "Success");
            break;
          case LoginStatus.failure:
            showInSnackBar(context, state.error);
            print(state.error);
            break;
          default:
            break;
        }
      },
      child: Align(
        alignment: Alignment.center,
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _loginLabelWidget(),
              const Padding(padding: EdgeInsets.all(20)),
              _emailWidget(),
              const Padding(padding: EdgeInsets.all(12)),
              _passwordWidget(),
              const Padding(padding: EdgeInsets.all(12)),
              _rememberMeWidget(),
              const Padding(padding: EdgeInsets.all(12)),
              _loginButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginLabelWidget() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Text(
          AppLocalizations.of(context)?.login ?? 'Login',
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: 25, color: Colors.black, fontWeight: FontWeight.w600),
        );
      },
    );
  }

  Widget _emailWidget() {
    return BlocBuilder<LoginBloc, LoginState>(
      // buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return TextField(
          controller: emailController,
          key: const Key('loginForm_usernameInput_textField'),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20, 24, 20, 16),
            hintText: AppLocalizations.of(context)?.username,
            suffixIcon: Icon(Icons.account_circle),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _passwordWidget() {
    return BlocBuilder<LoginBloc, LoginState>(
      // buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          controller: passwordController,
          key: const Key('loginForm_passwordInput_textField'),
          obscureText: true,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20, 24, 20, 16),
            hintText: AppLocalizations.of(context)?.password,
            suffixIcon: Icon(Icons.lock),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _rememberMeWidget() {
    return BlocBuilder<LoginBloc, LoginState>(
      // buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return CheckboxListTile(
          title: Text("Remember Me"),
          value: state.checkbox,
          onChanged: (value) {
            context
                .read<LoginBloc>()
                .add(RememberMeCheckboxChanged(value ?? false));
          },
          controlAffinity:
              ListTileControlAffinity.leading, //  <-- leading Checkbox
        );
      },
    );
  }

  Widget _loginButtonWidget() {
    return BlocBuilder<LoginBloc, LoginState>(
      // buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return ElevatedButton(
          key: const Key('loginForm_continue_raisedButton'),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
            child: Text(AppLocalizations.of(context)?.login ?? 'Login',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
          ),
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ))),
          onPressed: () {
            context.read<LoginBloc>().add(
                LoginSubmitted(emailController.text, passwordController.text));
          },
        );
      },
    );
  }

  void showInSnackBar(BuildContext context, String value) {
    // _scaffoldKey.currentState?.showSnackBar(new SnackBar(content: new Text(value)));
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
      content: Text(value),
      behavior: SnackBarBehavior.floating,
    ));
  }
}
