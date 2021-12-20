import 'package:vision/utils/all_imports.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(
      Duration(seconds: 2),
      () =>
      Navigator.pushAndRemoveUntil(context, LoginScreen.route(), (route) => false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Container(
        color: primaryColor,
      ),
    );
  }
}
