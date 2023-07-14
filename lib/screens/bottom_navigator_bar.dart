import 'package:flutter/material.dart';
import 'package:kun_rejasi/screens/about_user_screen.dart';
import 'package:kun_rejasi/screens/create_task.dart';
import 'package:kun_rejasi/screens/home_page.dart';
import 'package:kun_rejasi/screens/tasks_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentSelect = 0;
  List<Widget> pages = [const HomePage(), const TasksPage(),const AboutUserScreen()];

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData=MediaQuery.of(context);
    var size=mediaQueryData.size;
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          unselectedFontSize: 1,
          currentIndex: currentSelect,
          onTap: (value) {
            setState(() {
              currentSelect = value;
            });
          },
          items:  [
            BottomNavigationBarItem(
              icon: Image.asset("assets/logo/homefalse.png",width: size.height*0.05,height: size.height*0.05,),
              label: "",
              activeIcon: Image.asset("assets/logo/home.png",width: size.height*0.05,height: size.height*0.05)
            ),

            BottomNavigationBarItem(
                icon: Image.asset("assets/logo/notificationoutline.png",width: size.height*0.05,height: size.height*0.05,),
                label: "",
                activeIcon: Image.asset("assets/logo/nitfikation.png",width: size.height*0.05,height: size.height*0.05)
            ),
            BottomNavigationBarItem(
                icon: const Icon(Icons.account_circle_rounded,color: Color(0xff2B2B2BFF)),
                label: "",
                activeIcon:  Icon(Icons.account_circle_rounded,color: Colors.deepPurpleAccent,size:  size.height*0.05,)
            ),

          ],
        ),
        body: pages[currentSelect]);
  }
}
