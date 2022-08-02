import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sellsrateadmin/screens/complains/components/body.dart';
class Complains extends StatefulWidget {
  const Complains({Key? key}) : super(key: key);

  @override
  State<Complains> createState() => _ComplainsState();
}

class _ComplainsState extends State<Complains> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        centerTitle: true,
        title: Text('Complains', style: GoogleFonts.poppins(color: Colors.black),),
        elevation: 0, backgroundColor: Colors.white, iconTheme: IconThemeData(color: Colors.black),),
      body: ListView(
        children: [
          Body()        ],
      ),
    );
  }
}