import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:sellsrateadmin/services/user_service.dart';

class AuthenticationProvider with ChangeNotifier{
  String error = '';
 
  Future<UserCredential?>? register(email, password) async {
   
    UserService().getAdminCredentials(email).then((value) async {
        if(value.exists){
          if(value['email'] == email){
            if(value['password']== password){

              try{
                UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
                // if(userCredential != null){
                //   progressDialog.dismiss();
                //   Navigator.pushReplacementNamed(context, HomeScreen.id);
                // }
               
              }catch(e){
                 error = e.toString();
                // progressDialog.dismiss();
                UserService().showMyDialog(
                  //context: BuildContext(),
                  title: 'Login',
                  message: '${e.toString()}'
                );
                
              }
              return;
            }
           // progressDialog.dismiss();
          UserService().showMyDialog(
            //context: context,
            title: 'Incorrect Password',
            message: 'Password you have entered is invalid'
          );
            return;
          }
          //progressDialog.dismiss();
          UserService().showMyDialog(
           // context: context,
            title: 'Invalid Username',
            message: 'Username you have entered is incorrect'
          );
        }
        //progressDialog.dismiss();
          UserService().showMyDialog(
           // context: context,
            title: 'Invalid Username',
            message: 'Username you have entered is incorrect'
          );
      });

    notifyListeners();
    
  
    
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
        'number': number,
        'password' : password,
        'address': address,
        'dob': dob,
        'surname': surname,
        'country': country,
        'firstName' : firstName,
        'state' : state,
        'lga' : lga

      });
     // this.loading = false;
      notifyListeners();
    } catch (e) {
      print('Error $e');
    }
  }

  double subTotal = 0.0;
  int cartQty = 0;
  QuerySnapshot? snapshot;
  DocumentSnapshot? document;
  double saving = 0.0;
  double distance = 0.0;
  bool cod = false;
  List cartList = [];
  Future<double> getuserTotal() async {
    var cartTotal = 0.0;
    var saving = 0.0;
    List _newList = [];
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('products').get();
    if (snapshot == null) {
      
    }
    snapshot.docs.forEach((doc) {
      if(!_newList.contains(doc.data())){
        _newList.add(doc.data());
        this.cartList = _newList;
        notifyListeners();
      }
      cartTotal = cartTotal + doc['total'];
      saving =
          saving + ((doc['comparedPrice'] - doc['price']) > 0
              ? doc['comparedPrice'] - doc['price']
              : 0);
    });

    this.subTotal = cartTotal;
    this.cartQty = snapshot.size;
    this.snapshot = snapshot;
    this.saving = saving;
    notifyListeners();

    return cartTotal;
  }
}