

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sellsrateadmin/screens/complains/complains.dart';
import 'package:sellsrateadmin/screens/orders/all_orders.dart';
import 'package:sellsrateadmin/screens/sellers/all_sellers.dart';
import 'package:sellsrateadmin/screens/signIn/sign_in.dart';
import 'package:sellsrateadmin/screens/transactions/transactions.dart';

class HomeScreenDrawer extends StatelessWidget {
  const HomeScreenDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
    
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: ((context) {
                return AllOrders();
              })));
            },
            leading: Icon(Icons.shopping_bag),
            title: Text(
              "All Orders",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
           
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
             return Transactions();
           })));
            },
            leading: Icon(Icons.mobile_friendly_rounded),
            title: Text(
              "All Transaction",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            
          ),
         
          ListTile(
            leading: Icon(Icons.sell_outlined),
            title: Text(
              "All Sellers",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            onTap: () async {
           Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
             return AllSellers();
           })));
            },
          ),
          ListTile(
            leading: Icon(Icons.help_outline_rounded),
            title: Text(
              "Complaint",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            onTap: () async {
           Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
             return Complains();
           })));
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              "Sign out",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            onTap: () async {
                  showDialog(context: context, builder: (context){
                      return CupertinoAlertDialog(
                        title: Center(child: const Text('Are you sure?')),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children:[
                              InkWell(
                                onTap: (){
                                  FirebaseAuth.instance.signOut();
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                                    return SignInScreen();
                                  }));
                                  
                                },
                                child:  Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Yes', style: GoogleFonts.poppins(fontSize: 15, color: Colors.red),),
                                )),
                                VerticalDivider(width: 2,),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child:  Center(child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('No', style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.bold),),
                            )))
                            ]
                          )
                          
                        ],
                      );
                    });
              // final confirmation =
              //     await showConfirmationDialog(context, "Confirm Sign out ?");
              // if (confirmation) AuthentificationService().signOut();
            },
          ),
        ],
      ),
    );
  }
}
