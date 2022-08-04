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

  
  
    
  
  Future<int> gettodayProduct() async {
     DateTime birth = DateTime.now();
     String date = DateFormat('dd-MM-yyyy').format(birth);
    
    List _newList = [];
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('products').doc().collection('ordered_product').where('order_date', isEqualTo: date).get();
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

    
    this.productQty = snapshot.size;
    this.today = snapshot.size;
    this.price = price;
    notifyListeners();

    return today;
  }
}