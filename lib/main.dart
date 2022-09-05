import 'package:chat_app/screens/camera/camera_screen.dart';
import 'package:chat_app/screens/login/login_page.dart';

import 'package:chat_app/screens/new_screen/login.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "OpenSans",
        primaryColor: Colors.purple,
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.green).copyWith(
          secondary: Colors.green,
          primary: Color(0xFF075E54),
        ),
      ),
      home:
          //const Login()
          const LoginPage(),
    );
  }
}

// 0xFF128C7E
// 0xFF075E54
// 0xFF25D366
// 0xFF34B7F1