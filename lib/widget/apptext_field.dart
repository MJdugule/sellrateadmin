import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  AppTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    // required this.errorMessage,
    required this.validator, 
   this.errorText,
   required this.obstrust,
   this.icon,
   this.enabled
  }) : super(key: key);

  final String hintText;
   String? errorText;
   final bool? enabled;
  // final String errorMessage;
  final TextEditingController controller;
  String? Function(String?)? validator;
   final bool obstrust;
  Widget? icon;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  // AppTextField copyWith({
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7, horizontal: 20),
      child: TextFormField(
        enabled: widget.enabled,
        validator: widget.validator,
        onChanged: (value){
          setState(() {
            widget.errorText = null;
          });
          
        },
        //cursorColor: twilightBlue,
        controller: widget.controller,
        obscureText: widget.obstrust,
        decoration: InputDecoration(
              suffixIcon: widget.icon,
          errorText: widget.errorText,
          isDense: true,
          contentPadding:  EdgeInsets.fromLTRB(13, 14, 0, 14),
          hintText: widget.hintText,
          
          hintStyle: TextStyle(
            
              color: Colors.grey[500],
              fontFamily: 'PoppinsMedium',
              fontSize: 15),
              disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF999999)),
              // ignore: unnecessary_const
              borderRadius: BorderRadius.all(const Radius.circular(6))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF999999)),
              // ignore: unnecessary_const
              borderRadius: BorderRadius.all(const Radius.circular(6))),
          focusedBorder: const OutlineInputBorder(
             // borderSide: BorderSide(color: mainColor),
              borderRadius: BorderRadius.all(Radius.circular(6))),
          focusedErrorBorder: const OutlineInputBorder(
           // borderSide: BorderSide(color: mainColor),
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          errorBorder: const OutlineInputBorder(
          
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
        ),
      ),
    );
  }
}