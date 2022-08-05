import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sellsrateadmin/screens/home/homescreen.dart';
import 'package:sellsrateadmin/services/user_service.dart';

class AuthenticationProvider with ChangeNotifier{
  String error = '';
BuildContext? context;
 double subTotal = 0.0;
  int user = 0;
  QuerySnapshot? snapshot;
  DocumentSnapshot? document;
  double saving = 0.0;
  double distance = 0.0;
  bool cod = false;
  List cartList = [];
   login({firstname, password}) async {
    
       EasyLoading.show();
      UserService().getAdminCredentials(firstname).then((value) async {
        if(value.exists){
          if(value['firstName'] == firstname){
            if(value['password']== password){

              try{
                UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
                if(userCredential != null){
                  EasyLoading.dismiss();
                  Navigator.pushReplacement(context!, MaterialPageRoute(builder: ((context) {
                   return HomeScreen();
                  })));
                }
               
              }catch(e){
                 EasyLoading.dismiss();
                UserService().showMyDialog(
                  context: context,
                  title: 'Login',
                  message: '${e.toString()}'
                );
                
              }
              return;
            }
            EasyLoading.dismiss();
                UserService().showMyDialog(
            context: context,
            title: 'Incorrect Password',
            message: 'Password you have entered is invalid'
          );
            return;
          }
          EasyLoading.dismiss();
                UserService().showMyDialog(
            context: context,
            title: 'Invalid Username',
            message: 'Username you have entered is incorrect'
          );
        }else{
               EasyLoading.dismiss();
                UserService().showMyDialog(
            context: context,
            title: 'Invalid Username',
            message: 'Username you have entered is incorrect'
          );
        }
         EasyLoading.dismiss();
                UserService().showMyDialog(
            context: context,
            title: 'Invalid Username',
            message: 'Username you have entered is incorrect'
          );
      });
    }
 
  Future<UserCredential?>? register(email, password) async {


              UserCredential? userCredential;
              try{
                userCredential = await FirebaseAuth.instance.signInAnonymously();
                // if(userCredential != null){
                //   progressDialog.dismiss();
                //   Navigator.pushReplacementNamed(context, HomeScreen.id);
                // }
               
              }catch(e){
                 error = e.toString();
              
                
              }
              notifyListeners();
              return userCredential;

           // progressDialog.dismiss();

          //progressDialog.dismiss();



    
    

    
  }

   void createUser({
    String? id,
    String? number,
    String? email,
    String? password,
    String? address,
    String? firstName,
    String? surname,
    String? country,
    String? state,
    String? lga,
    String? dob,
    
  }) async {
    try {
      UserService().createUserData({
        'id': id,
        'email': email,
        'number': '',
        'password' : password,
        'address': '',
        'dob': '',
        'surname': surname,
        'country': '',
        'firstName' : firstName,
        'state' : '',
        'lga' : ''

      });
     // this.loading = false;
      notifyListeners();
    } catch (e) {
      print('Error $e');
    }
  }

    void updateUser({
      String? id,
      String? firstName,
  String? address,
    String? number,
    String? country,
    String? state,
    String? lga,
    String? dob,
  }) async {
    try {
      UserService().updateUserData({
        'id': id,
        'number': number,
        'address': address,
        'country': country,
        'state': state,
        'firstName': firstName,
        'lga': lga,
        'dob': dob,
       
      });
      
      notifyListeners();
    } catch (e) {
      print('Error $e');
    }
  }

 

  Future<double> getuserTotal() async {
    var cartTotal = 0.0;
    var saving = 0.0;
    List _newList = [];
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').get();
    if (snapshot == null) {
      
    }
    snapshot.docs.forEach((doc) {
      if(!_newList.contains(doc.data())){
        _newList.add(doc.data());
        this.cartList = _newList;
        notifyListeners();
      }
      
    });

    this.subTotal = cartTotal;
    this.user = snapshot.size;
    this.snapshot = snapshot;
    this.saving = saving;
    notifyListeners();

    return cartTotal;
  }
}