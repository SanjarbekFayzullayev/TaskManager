import 'package:flutter/material.dart';
import 'package:kun_rejasi/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HeaderText extends StatefulWidget {
  const HeaderText({Key? key}) : super(key: key);

  @override
  State<HeaderText> createState() => _HeaderTextState();
}

class _HeaderTextState extends State<HeaderText> {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hello $username!",
          style: const TextStyle(
              fontSize: 26,
              color: Color(0xff2E3A59),
              fontWeight: FontWeight.bold),
        ),
        const Text("Have a nice day.",
            style: TextStyle(color: Color(0xff8890A5))),
        const SizedBox(height: 16),
      ],
    );
  }
}
