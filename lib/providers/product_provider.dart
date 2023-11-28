import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class ProductProvider with ChangeNotifier{

  double subTotal = 0.0;
  int productQty = 0;
  int today = 0;
  QuerySnapshot? snapshot;
  DocumentSnapshot? document;
  double price = 0.0;
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
      //cartTotal = cartTotal + doc['total'];
      // price =
      //     price + doc['prices'];
    });

    this.subTotal = cartTotal;
    this.productQty = snapshot.size;
    this.snapshot = snapshot;
    this.price = price;
    notifyListeners();

    return cartTotal;
  }  

 Future<double> getproductSeller() async {
    var cartTotal = 0.0;
    var saving = 0.0;
    List _newList = [];
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('user').get();
    if (snapshot == null) {
      
    }
    snapshot.docs.forEach((doc) {
      if(!_newList.contains(doc.get('seller'))){
        _newList.add(doc.get('seller'));
        this.productList = _newList;
        notifyListeners();
      }
      //cartTotal = cartTotal + doc['total'];
      // price =
      //     price + doc['prices'];
    });
print(productList.length);
    this.subTotal = cartTotal;
    this.productQty = snapshot.size;
    this.snapshot = snapshot;
    this.price = price;
    notifyListeners();

    return cartTotal;
  }   
  
    
  
  Future<double> gettodayProduct() async {
     DateTime birth = DateTime.now();
     String date = DateFormat('dd-MM-yyyy').format(birth);
    var cartTotal = 0.0;
    var saving = 0.0;
    List _newList = [];
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').doc().collection('ordered_products').where('order_date', isEqualTo:"4-8-2022").get();
    if (snapshot == null) {
      
    }
    snapshot.docs.forEach((doc) {
      if(!_newList.contains(doc.data())){
        _newList.add(doc.data());
        this.productList = _newList;
        notifyListeners();
      }
      //cartTotal = cartTotal + doc['total'];
      // price =
      //     price + doc['prices'];
    });

   
    //this.productQty = snapshot.size;
    today = snapshot.size;
    this.snapshot = snapshot;
    this.price = price;
    notifyListeners();

    return cartTotal;
  }
}