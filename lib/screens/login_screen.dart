import 'package:flutter/material.dart';
import 'package:kun_rejasi/constants/constants.dart';
import 'package:kun_rejasi/screens/bottom_navigator_bar.dart';
import 'package:kun_rejasi/screens/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var nameController = TextEditingController();

  var filNameController = TextEditingController();

  late SharedPreferences loginData;
  late bool newUser;

  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var size = mediaQueryData.size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Welcome to \nTask Manager App",
                style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              Column(
                children: [
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  SizedBox(
                    width: size.width * 0.88,
                    height: 60,
                    child: TextFormField(
                      style: const TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold),
                      cursorColor: Colors.grey,
                      controller: nameController,
                      decoration: const InputDecoration(
                        hintText: "Name",
                        hintStyle: TextStyle(color: Colors.grey),
                        labelText: "Name",
                        labelStyle: TextStyle(color: Colors.deepPurple),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),

                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              style: BorderStyle.none, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  SizedBox(
                    width: size.width * 0.88,
                    height: 60,
                    child: TextField(
                      style: const TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold),
                      cursorColor: Colors.deepPurple,
                      controller: filNameController,
                      decoration: const InputDecoration(
                        labelStyle: TextStyle(color: Colors.deepPurple),
                        hintText: "Last name",
                        hintStyle: TextStyle(color: Colors.grey),
                        labelText: "Last name",
                        border: OutlineInputBorder(),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              style: BorderStyle.none, color: Colors.white),
                        ),
                      ),

                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                ],
              ),
              InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                onTap: () {
                  String username = nameController.text;
                  String filName = filNameController.text;

                  if (username != '' && filName != '') {
                    loginData.setBool("login", false);
                    loginData.setString("username", username);
                    loginData.setString("filName", filName);
                    // Navigator.removeRoute(context, MaterialPageRoute(builder: (context) => const BottomNavBar(),));
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BottomNavBar(),
                        ),
                        (route) => true);
                    print("Kir");
                  } else {
                    Constants().snackBar(
                        'Enter your first and last name', context, Colors.deepPurple);
                  }
                },
                child: SizedBox(
                  width: size.width * 0.88,
                  height: 50,
                  child: const Material(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                    color: Colors.deepPurple,
                    child: Center(
                      child: Text(
                        "Next",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void checkLogin() async {
    loginData = await SharedPreferences.getInstance();
    newUser = (loginData.getBool("login") ?? true);
    if (newUser == false) {
      // ignore: use_build_context_synchronously
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomNavBar(),
          ));
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    filNameController.dispose();
    super.dispose();
  }
}
