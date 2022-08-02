import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sellsrateadmin/screens/transactions/components/body.dart';
import 'package:sellsrateadmin/screens/transactions/components/transboxes.dart';

class Transactions extends StatefulWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        centerTitle: true,
        title: Text('Transaction', style: GoogleFonts.poppins(color: Colors.black),),
        elevation: 0, backgroundColor: Colors.white, iconTheme: IconThemeData(color: Colors.black),),
      body: ListView(
        children: [
          TransBoxes(),
          Body()
                  ],
      ),
    );
  }
}