import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sellsrateadmin/screens/home/component/home_widget.dart';

class HomeBoxes extends StatefulWidget {
  const HomeBoxes({Key? key}) : super(key: key);

  @override
  State<HomeBoxes> createState() => _HomeBoxesState();
}

class _HomeBoxesState extends State<HomeBoxes> {
  @override
  Widget build(BuildContext context) {
     return ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 550),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                childAspectRatio: (170 / 130),
                mainAxisSpacing: 30,
                crossAxisSpacing: 20,
                children: [
                  InkWell(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => AllTasksScreen()));
                      },
                      child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance.collection('Products').snapshots(),
                        builder: ((BuildContext context, AsyncSnapshot<QuerySnapshot> snapShot) {
                        if(snapShot.hasError){

                        }
                      }))
                      HomeWidget(color: Colors.red, text: 'Total Users')),
                  HomeWidget(color: Colors.lime, text: 'Total Products'),
                  InkWell(
                    onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => SharedTask()));
                      },
                      child: HomeWidget(color: Colors.black, text: 'Shared Tasks')),
                  InkWell(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => BucketList()));
                      },
                      child: HomeWidget(color: Colors.cyan, text: 'My Lists')),
                ],
              ),
            );
  }
}