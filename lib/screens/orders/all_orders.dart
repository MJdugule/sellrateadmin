import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sellsrateadmin/screens/orders/components/body.dart';

class AllOrders extends StatefulWidget {
  const AllOrders({Key? key}) : super(key: key);

  @override
  State<AllOrders> createState() => _AllOrdersState();
}

class _AllOrdersState extends State<AllOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        centerTitle: true,
        title: Text('All Orders', style: GoogleFonts.poppins(color: Colors.black),),
        elevation: 0, backgroundColor: Colors.white, iconTheme: IconThemeData(color: Colors.black),),
      body: ListView(
        children: [
          Body()        ],
      ),
    );
  }
}