import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sellsrateadmin/screens/signIn/component/body.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Body()
        ],
      ),
    );
  }
}
