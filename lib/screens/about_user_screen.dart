import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kun_rejasi/database/database_helper.dart';
import 'package:kun_rejasi/screens/login_screen.dart';
import 'package:kun_rejasi/widgets/scrool_menyu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AboutUserScreen extends StatefulWidget {
  const AboutUserScreen({Key? key}) : super(key: key);

  @override
  State<AboutUserScreen> createState() => _AboutUserScreenState();
}

class _AboutUserScreenState extends State<AboutUserScreen> {
  String username = '';
  String filName = '';
  late SharedPreferences loginData;

  @override
  void initState() {
    initial();
    super.initState();
  }

  void initial() async {
    loginData = await SharedPreferences.getInstance();
    setState(() {
      username = loginData.getString("username")!;
      filName = loginData.getString("filName")!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F5FF),
      body: Column(
        children: [
          userCard(),
          tasksList(),
        ],
      ),
    );
  }

  //Widgets User header card
  Widget userCard() {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var size = mediaQueryData.size;
    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bg.png"),
              alignment: Alignment.topRight),
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Color(0xff9C2CF3),
                Color(0xff3A49F9),
              ]),
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20))),
      child: SafeArea(
        child: Column(
          children: [
            Icon(
              CupertinoIcons.person_alt_circle,
              color: Colors.white,
              size: size.height * 0.2,
            ),
            Text(
              "Welcome $username $filName",
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            TextButton(
                onPressed: () {
                  _alderDialog();
                },
                child: const Text(
                  "Logout",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ))
          ],
        ),
      ),
    );
  }

  //Widget tasks list
  Widget tasksList() {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var size = mediaQueryData.size;
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.height * 0.03, vertical: size.height * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Task list",
              style: TextStyle(
                  fontSize: size.height * 0.04,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff9C2CF3)),
            ),
            SizedBox(height: size.height * 0.4, child: const ScrollMenu())
          ],
        ));
  }

  void _alderDialog() async {
    await showDialog<bool>(
        context: context,
        builder: (context) =>
            AlertDialog(
              backgroundColor: Colors.white,
              title: Text(
                "$username $filName",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.deepPurple,
                ),
              ),
              content: const Text("Logout this app?"),
              actions: [
                ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor:
                        MaterialStatePropertyAll(Colors.deepPurple)),
                    onPressed: () async {
                      DatabaseHelper.intancee.clearUserTable();
                      loginData.clear();
                        updateList(context);
                        Navigator.pop(context);

                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                        builder: (context) => LoginScreen(),), (route) => false);
                    },
                    child: const Text("Yes")),
                ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor:
                        MaterialStatePropertyAll(Colors.deepPurple)),
                    onPressed: () {
                      Navigator.pop(context);
                      // Navigator.of(context).pop(false);
                    },
                    child: const Text("No")),
              ],
            ));
  }
}
