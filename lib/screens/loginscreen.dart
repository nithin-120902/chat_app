// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, non_constant_identifier_names

import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:chat_app/components/button.dart';
import 'package:chat_app/components/inputtextfield.dart';
import 'package:chat_app/screens/chatscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'loginscreen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _auth = FirebaseAuth.instance;

  bool showSpinner = false;

  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlurryModalProgressHUD(
        progressIndicator: SpinKitHourGlass(color: Colors.blueAccent),
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: SizedBox(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              InputTextField(
                obscureText: false,
                type:TextInputType.emailAddress,
                onChanged: (value) {
                  email = value!;
                },
                HintText:"Enter your email",
              ),
              SizedBox(
                height: 8.0,
              ),
              InputTextField(
                obscureText: true,
                type: TextInputType.visiblePassword,
                onChanged: (value){
                  password=value!;
                },
                HintText: 'Enter your password.',
              ),
              SizedBox(
                height: 24.0,
              ),
              Button(
                title: "Log In",
                onPressed: () async{
                  setState(() {
                    showSpinner=true;
                  });
                  try {
                    final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                    if(user!=null){
                      Navigator.popAndPushNamed(context, ChatScreen.id);
                    }
                    setState(() {
                      showSpinner=false;
                    });
                  } catch (e) {
                    print(e); 
                  }
                },
                color: Colors.lightBlueAccent,
              )
            ],
          ),
        ),
      ),
    );
  }
}
