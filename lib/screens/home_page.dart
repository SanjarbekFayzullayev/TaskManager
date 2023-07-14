import 'package:flutter/material.dart';
import 'package:kun_rejasi/model/task.dart';
import 'package:kun_rejasi/screens/login_screen.dart';
import 'package:kun_rejasi/widgets/cardes.dart';
import 'package:kun_rejasi/widgets/chipes.dart';
import 'package:kun_rejasi/widgets/scrool_menyu.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/header_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
late SharedPreferences loginData;

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
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
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var size = mediaQueryData.size;
    return Scaffold(
      backgroundColor: const Color(0xffF2F5FF),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xff2E3A59)),
        backgroundColor: const Color(0xffF2F5FF),
        elevation: 0,
        leading:const Icon(Icons.dehaze_outlined),
        actions: const [
           Padding(
             padding: EdgeInsets.all(8.0),
             child: Icon(
              Icons.account_circle_rounded,
              color: Color(0xff2E3A59),
          ),
           )
        ],
      ),
      // drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               const HeaderText(),
              const Chipes(),
              const MyCards(),
              SizedBox(height: size.height * 0.8, child: const ScrollMenu()),
            ],
          ),
        ),
      ),
    );
  }

}
