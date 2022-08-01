import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sellsrateadmin/constants.dart';
import 'package:sellsrateadmin/screens/home/component/home_widget.dart';
import 'package:sellsrateadmin/screens/home/component/homeboxes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
                 SafeArea(child: Container()),
           Text(
                "Register Account",
                style: headingStyle,
              ),
        HomeBoxes()
        ],
      ),
    );
  }
}