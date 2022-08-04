import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'package:sellsrateadmin/constants.dart';
import 'package:sellsrateadmin/providers/auth_provider.dart';
import 'package:sellsrateadmin/screens/home/homescreen.dart';
import 'package:sellsrateadmin/screens/registration/reg_screen.dart';
import 'package:sellsrateadmin/services/user_service.dart';
import 'package:sellsrateadmin/widget/apptext_field.dart';
import 'package:sellsrateadmin/widget/default_button.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  FlutterSecureStorage storage = FlutterSecureStorage();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  
  final _formkey = GlobalKey<FormState>();
  DateTime _birth = DateTime.now();
  String? code;
  bool _visible = false;
  bool _visible2 = false;
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    String date = DateFormat('yyyy-MM-dd').format(_birth);
    final _authData = Provider.of<AuthenticationProvider>(context);

    return Form(
      key: _formkey,
      child: Column(
        children: [
          SafeArea(child: Container()),
           Text(
                "Create Your Account",
                style: headingStyle,
              ),
             
              SizedBox(height: 20,),
          AppTextField(
            obstrust: false,
            hintText: 'First Name',
            controller: firstnameController,
            validator: (email) {
              if (email!.isEmpty) {
                return 'First name field cannot be empty';
              }
    
              return null;
            },
          ),
          AppTextField(
            obstrust: false,
            hintText: 'Surname',
            controller: surnameController,
            validator: (surname) {
              if (surname!.isEmpty) {
                return 'Email field cannot be empty';
              }
    
              return null;
            },
          ),
          
          AppTextField(
            obstrust: false,
            hintText: 'Email',
            controller: emailController,
            validator: (email) {
              if (email!.isEmpty) {
                return 'Email field cannot be empty';
              }
              return null;
            },
          ),
          AppTextField(
            icon: IconButton(
              icon: _visible
                  ? Icon(
                      Icons.visibility_off,
                      // color: redTextColor,
                    )
                  : Icon(
                      Icons.visibility,
                      // color: mainColor,
                    ),
              onPressed: () {
                setState(() {
                  _visible = !_visible;
                });
              },
            ),
            obstrust: _visible == false ? true : false,
            hintText: 'Password',
            controller: passwordController,
            validator: (password) {
              if (password!.isEmpty) {
                return 'Password field cannot be empty';
              } else if (password.length < 8) {
                return 'Enter a longer password';
              } else if (!password.contains(RegExp(r"[0-9]"))) {
                return 'Password must contain a number';
              }
              return null;
            },
          ),
          AppTextField(
            obstrust: _visible2 == false ? true : false,
            icon: IconButton(
              icon: _visible2
                  ? Icon(
                      Icons.visibility_off,
                      // color: Colors.red,
                    )
                  : Icon(
                      Icons.visibility,
                      //  color: mainColor,
                    ),
              onPressed: () {
                setState(() {
                  _visible2 = !_visible2;
                });
              },
            ),
            hintText: 'Confirm Password',
            controller: confirmPassController,
            validator: (confirm) {
              if (confirm!.isEmpty) {
                return 'Password field cannot be empty';
              } else if (confirm != passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 45,
              width: 250,
              child: TextButton(
                          style: ElevatedButton.styleFrom(
                            onSurface: Colors.white,
                            primary: Colors.black, //background color of button
                            elevation: 8, //elevation of button
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
                          ),
                          onPressed: ()async{
                             FocusScope.of(context).unfocus();
                                    if (_formkey.currentState!.validate()) {
                                  EasyLoading.show();
                     
                                setState(() {
                                  _loading = true;
                                });
                                final User? user =
                                    (await _authData.register(emailController.text, passwordController.text))
                                        ?.user;

                                if (user != null) {
                                  setState(() {
                                    EasyLoading.dismiss();
                                    _loading = false;
                                  });
                    
                                      _authData.createUser(
                                        firstName: firstnameController.text,
                                        surname: surnameController.text,
                                          id: user.uid, password: passwordController.text, email: emailController.text);
                                          await storage.write(key: 'firstname', value: firstnameController.text);
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) {
                                        return RegistrationScreen();
                                      })));
                                 
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          backgroundColor: Colors.black87,
                                          duration: Duration(seconds: 5),
                                          content: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(_authData.error),
                                              Icon(
                                                Icons.cancel_outlined,
                                                color: Colors.red,
                                                size: 26,
                                              )
                                            ],
                                          )));
                                }
                              } else {
                                setState(() {
                                  _loading = false;
                                });
                                //scaffoldMessage('Please complete all field');
                              }
                          },
                          child: Text(
                            'SignUp',
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontStyle: FontStyle.normal,
                                color: Colors.white,
                                ),
                          )),
            ),
          )
        ],
      ),
    );
  }

  
}
