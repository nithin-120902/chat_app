// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison, use_build_context_synchronously

import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:chat_app/components/button.dart';
import 'package:chat_app/components/inputtextfield.dart';
import 'package:chat_app/screens/chatscreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registrationscreen';
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late String email;
  late String password;

  bool showSpinner = false;

  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlurryModalProgressHUD(
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
                type: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value!;
                },
                HintText: "Enter your email",
              ),
              SizedBox(
                height: 8.0,
              ),
              InputTextField(
                obscureText: true,
                type: TextInputType.visiblePassword,
                onChanged: (value) {
                  password = value!;
                },
                HintText: 'Enter your password.',
              ),
                SizedBox(
                  height: 24.0,
                ),
                Button(
                    title: 'Register', 
                    color: Colors.blueAccent, 
                    onPressed: () async {
                      setState(() {
                        showSpinner=true;
                      });
                      try {
                        final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                        if(newUser != null){
                          Navigator.popAndPushNamed(context,ChatScreen.id);
                        }

                        setState(() {
                          showSpinner=false;
                        });
                      } catch (e) {
                        print(e); 
                      }
        
                    }
                ),
              ],
            ),
          ),
      ),
    );
  }
}
