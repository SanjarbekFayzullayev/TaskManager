import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kun_rejasi/main_provider.dart';
import 'package:kun_rejasi/screens/login_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      MultiProvider( providers: [
    ChangeNotifierProvider(
      create: (context) => MainProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return  MaterialApp(

      color: Colors.deepPurple,
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
