import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo/firebase_options.dart';
import 'package:todo/theme/app_theme.dart';
import 'package:todo/views/bottom_navigation_bar.dart';
import 'package:todo/views/login_view.dart';
import 'package:todo/views/sign_up_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await FirebaseFirestore.instance.enableNetwork();
  await FirebaseFirestore.instance.disableNetwork();
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      initialRoute: LoginScreen.routName,
      routes: {
        BottomNavigationBarr.routName: (context) => BottomNavigationBarr(),
        LoginScreen.routName: (context) => LoginScreen(),
        SignUpView.routName: (context) => SignUpView(),
      },
    );
  }
}
