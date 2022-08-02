import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sellsrateadmin/screens/home/homescreen.dart';
import 'package:sellsrateadmin/screens/signIn/sign_in.dart';
import 'package:sellsrateadmin/screens/signUp/signup_screen.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
    @override
  void initState() {
   
      // Navigator.pushReplacementNamed(context, WelcomeScreen.id);
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) {
            return SignInScreen();
          })));
        } else {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) {
            return HomeScreen();
          })));
        }
      });
   
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}