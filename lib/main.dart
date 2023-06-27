// ignore_for_file: prefer_const_constructors

import 'package:chat_app/screens/chatscreen.dart';
import 'package:chat_app/screens/loginscreen.dart';
import 'package:chat_app/screens/registrationscreen.dart';
import 'package:chat_app/screens/welcomescreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{

  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyA2kHaXdrL7wCbnMyxlX-eLYoKOHE3Fn58',
          appId: '1:963308112590:android:d5b7ea8c0299565b309e9f',
          messagingSenderId: '963308112590',
          projectId: 'chat-app-4cd41'));
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