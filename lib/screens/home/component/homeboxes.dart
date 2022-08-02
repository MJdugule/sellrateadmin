import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:sellsrateadmin/providers/product_provider.dart';
import 'package:sellsrateadmin/screens/home/component/home_widget.dart';

class HomeBoxes extends StatefulWidget {
  const HomeBoxes({Key? key}) : super(key: key);

  @override
  State<HomeBoxes> createState() => _HomeBoxesState();
}

class _HomeBoxesState extends State<HomeBoxes> {
  @override
  Widget build(BuildContext context) {
    final _productProvider = Provider.of<ProductProvider>(context);
    _productProvider.getproductTotal();
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal:15.0),
      child: ConstrainedBox(
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
                child: HomeWidget(
                    color: Color(0xFFFFA5A9),
                    title: 'Total Users',
                    text: '${_productProvider.productQty}')),
            InkWell(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => AllTasksScreen()));
                },
                child: HomeWidget(
                    color: Color(0xFFCDCEFF),
                    title: 'Total Products',
                    text: '${_productProvider.productQty}')),
            InkWell(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => AllTasksScreen()));
                },
                child: HomeWidget(
                    color: Color(0xFFE3B5FF),
                    title: 'Shared Tasks',
                    text: '${_productProvider.productQty}')),
            InkWell(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => AllTasksScreen()));
                },
                child: HomeWidget(
                    color: Color(0xFFFFE79F),
                    title: 'My Lists',
                    text: '${_productProvider.productQty}')),
          ],
        ),
      ),
    );
  }
}
