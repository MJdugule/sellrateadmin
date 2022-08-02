import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:sellsrateadmin/providers/product_provider.dart';
import 'package:sellsrateadmin/screens/home/component/home_widget.dart';
import 'package:sellsrateadmin/screens/transactions/components/trans_widget.dart';

class TransBoxes extends StatefulWidget {
  const TransBoxes({Key? key}) : super(key: key);

  @override
  State<TransBoxes> createState() => _TransBoxesState();
}

class _TransBoxesState extends State<TransBoxes> {
  @override
  Widget build(BuildContext context) {
    final _productProvider = Provider.of<ProductProvider>(context);
    _productProvider.getproductTotal();
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal:15.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 550),
        child: GridView.count(
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          shrinkWrap: true,
          childAspectRatio: (180 / 130),
          mainAxisSpacing: 30,
          crossAxisSpacing: 10,
          children: [
             InkWell(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => AllTasksScreen()));
                },
                child: TransactionWidget(
                  icon: Icons.monetization_on
                  ,
                    color: Color.fromARGB(255, 98, 207, 154),
                    title: 'Approved',
                    text: '${_productProvider.productQty}')),
            InkWell(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => AllTasksScreen()));
                },
                child: TransactionWidget(
                  icon: Icons.person,
                    color: Color.fromARGB(255, 245, 146, 17),
                    title: 'Pending',
                    text: '${_productProvider.productQty}')),
            InkWell(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => AllTasksScreen()));
                },
                child: TransactionWidget(
                  icon: Icons.shopping_bag,
                    color: Color.fromARGB(255, 245, 89, 17),
                    title: 'Declined',
                    text: '${_productProvider.productQty}')),
           
       
          ],
        ),
      ),
    );
  }
}
