import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider with ChangeNotifier{

  double subTotal = 0.0;
  int productQty = 0;
  QuerySnapshot? snapshot;
  DocumentSnapshot? document;
  double saving = 0.0;
  double distance = 0.0;
  bool cod = false;
  List productList = [];
  Future<double> getproductTotal() async {
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
        this.productList = _newList;
        notifyListeners();
      }
      cartTotal = cartTotal + doc['total'];
      saving =
          saving + ((doc['comparedPrice'] - doc['price']) > 0
              ? doc['comparedPrice'] - doc['price']
              : 0);
    });

    this.subTotal = cartTotal;
    this.productQty = snapshot.size;
    this.snapshot = snapshot;
    this.saving = saving;
    notifyListeners();

    return cartTotal;
  }
}