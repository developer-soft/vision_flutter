import 'package:vision/utils/all_imports.dart';

class DashboardScreen extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => DashboardScreen());
  }

  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Vision")),
        body: const Center(
          child: Text("Dashboard"),
        ),
        drawer: SafeArea(
          child: Drawer(
            // Add a ListView to the drawer. This ensures the user can scroll
            // through the options in the drawer if there isn't enough vertical
            // space to fit everything.
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                ExpansionTile(
                  title: Text("Sales"),
                  children: <Widget>[
                    GestureDetector(
                      child: SizedBox(
                          width: 250,
                          height: 35,
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Card(
                                  child: Center(child: Text("All Sales"))))),
                      onTap: () {},
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    GestureDetector(
                      child: SizedBox(
                          width: 250,
                          height: 35,
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Card(
                                  child: Center(child: Text("Add Sale"))))),
                      onTap: () {},
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text("Products"),
                  children: <Widget>[
                    GestureDetector(
                      child: SizedBox(
                          width: 250,
                          height: 35,
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Card(
                                  child:
                                      Center(child: Text("List Products"))))),
                      onTap: () {},
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    GestureDetector(
                      child: SizedBox(
                          width: 250,
                          height: 35,
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Card(
                                  child: Center(child: Text("Add Products"))))),
                      onTap: () {},
                    ),
                  ],
                ),
                SizedBox(
                  height: 7,
                ),
                GestureDetector(
                  child: SizedBox(
                      width: 250,
                      height: 35,
                      child: Container(
                          child: Card(child: Center(child: Text("Logout"))))),
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context, LoginScreen.route(), (route) => false);
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
