import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sellsrateadmin/constants.dart';
import 'package:sellsrateadmin/screens/home/component/chart.dart';
import 'package:sellsrateadmin/screens/home/component/home_header.dart';
import 'package:sellsrateadmin/screens/home/component/home_screen_drawer.dart';
import 'package:sellsrateadmin/screens/home/component/home_widget.dart';
import 'package:sellsrateadmin/screens/home/component/homeboxes.dart';
import 'package:sellsrateadmin/screens/home/component/revenue.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeScreenDrawer(),
      body: ListView(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeHeader(),
                 SafeArea(child: Container()),
           HomeBoxes(),
       
        HomeChart(),
        
        ],
      ),
    );
  }
}