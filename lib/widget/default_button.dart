import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class DefaultButton extends StatelessWidget {
  final String? text;
  final void Function()? press;
  final Color? color;
  const DefaultButton({
     Key? key,
    this.text,
    this.press,
    this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
                      style: ElevatedButton.styleFrom(
                        onSurface: Colors.white,
                        primary: color, //background color of button
                        elevation: 8, //elevation of button
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                      ),
                      onPressed: press,
                      child: Text(
                        text!,
                        style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontStyle: FontStyle.normal,
                            color: Colors.white,
                            ),
                      ));
  }
}
