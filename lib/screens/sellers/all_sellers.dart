import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sellsrateadmin/screens/sellers/components/body.dart';
class AllSellers extends StatefulWidget {
  const AllSellers({Key? key}) : super(key: key);

  @override
  State<AllSellers> createState() => _AllSellersState();
}

class _AllSellersState extends State<AllSellers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        centerTitle: true,
        title: Text('All Sellers', style: GoogleFonts.poppins(color: Colors.black),),
        elevation: 0, backgroundColor: Colors.white, iconTheme: IconThemeData(color: Colors.black),),
      body: ListView(
        children: [
          Body()        ],
      ),
    );
  }
}