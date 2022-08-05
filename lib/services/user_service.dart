import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserService{
    Future<DocumentSnapshot> getAdminCredentials(id) {
    var result = FirebaseFirestore.instance.collection('Admin').doc(id).get();
    return result;
  }

  Future<void> createUserData(Map<String, dynamic>values)async {
  String id = values['firstName'];
  await FirebaseFirestore.instance.collection('Admin').doc(id).set(values);
}

Future<void> updateUserData(Map<String, dynamic>values)async {
  String id = values['firstName'];
  await FirebaseFirestore.instance.collection('Admin').doc(id).update(values);
}

  Future<void> showMyDialog({context, title, message}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
                
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}