import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sellsrateadmin/providers/product_provider.dart';

class Revenue extends StatefulWidget {
  const Revenue({Key? key}) : super(key: key);

  @override
  State<Revenue> createState() => _RevenueState();
}

class _RevenueState extends State<Revenue> {
  @override
  Widget build(BuildContext context) {
     final _productProvider = Provider.of<ProductProvider>(context);
    _productProvider.getproductTotal();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:15.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(.4), ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.4),
                offset: const Offset(0, 0),
                blurRadius: 25,
              ),
            ],
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 15, bottom: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Income',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ), Text(
                '\$${_productProvider.price}',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 35,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        // ),
      ),
    );
  }
}
