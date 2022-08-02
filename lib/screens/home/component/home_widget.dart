import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key, required this.color, required this.text, required this.title}) : super(key: key);
  final Color color;
  final String text;
  final String title;

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return    Container(
      decoration: BoxDecoration(
          color: widget.color, borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: Column(
          children: [
            Text(
              widget.title,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 21,
              ),
              textAlign: TextAlign.center,
            ), Text(
              widget.text,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      // ),
    );
  }
}