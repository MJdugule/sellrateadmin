import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:sellsrateadmin/providers/auth_provider.dart';
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
    final _authProvider = Provider.of<AuthenticationProvider>(context);
    _authProvider.getuserTotal();

    final _productProvider = Provider.of<ProductProvider>(context);
    _productProvider.getproductTotal();
    //_productProvider.gettodayProduct();
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal:15.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 550),
        child: GridView.count(
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          shrinkWrap: true,
          childAspectRatio: (150 / 130),
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
                  icon: Icons.monetization_on
                  ,
                    color: Color.fromARGB(255, 165, 98, 207),
                    title: 'Total Income',
                    text: '\${_productProvider.price}')),
            InkWell(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => AllTasksScreen()));
                },
                child: HomeWidget(
                  icon: Icons.person,
                    color: Color.fromARGB(255, 218, 138, 142),
                    title: 'Total Users',
                    text: '${_authProvider.user}')),
            InkWell(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => AllTasksScreen()));
                },
                child: HomeWidget(
                  icon: Icons.shopping_bag,
                    color: Color.fromARGB(255, 160, 161, 229),
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
                  icon: Icons.wallet,
                    color: Color.fromARGB(255, 244, 208, 102),
                    title: 'Today Sales',
                    text: '\$${_productProvider.today}')),
          ],
        ),
      ),
    );
  }
}
