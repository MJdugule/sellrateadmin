import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sellsrateadmin/screens/sellers/components/sellers_card.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
       return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Please check your Internet Connection'));
        }

        if(!snapshot.hasData){
          return Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('List is empty'),
             
            ],
          ));
        }

        return  ListView(
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: 
          snapshot.data!.docs.map((DocumentSnapshot document) {
            print(snapshot.data!.docs.length);
            return SellersCard();
            
            //CartCard(document: document,);
          }).toList(),
        );
      },
    );
  }
}