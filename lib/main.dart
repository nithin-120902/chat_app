// ignore_for_file: prefer_const_constructors

import 'package:chat_app/screens/chatscreen.dart';
import 'package:chat_app/screens/loginscreen.dart';
import 'package:chat_app/screens/registrationscreen.dart';
import 'package:chat_app/screens/welcomescreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:chat_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: firebaseOptions
  );
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id:(context) => WelcomeScreen(),
        LoginScreen.id:(context) => LoginScreen(),
        RegistrationScreen.id:(context) => RegistrationScreen(),
        ChatScreen.id:(context) => ChatScreen(),
      },
    );
  }
}