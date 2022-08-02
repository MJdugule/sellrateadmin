import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sellsrateadmin/constants.dart';
import 'package:sellsrateadmin/providers/auth_provider.dart';
import 'package:sellsrateadmin/screens/home/homescreen.dart';
import 'package:sellsrateadmin/widget/apptext_field.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  String? code;
  bool _visible = false;
  bool _visible2 = false;
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    final _authData = Provider.of<AuthenticationProvider>(context);
    return Form(
      key: _formkey,
      child: Column(
        children: [
          SafeArea(child: Container()),
          Text(
            "Login to Account",
            style: headingStyle,
          ),
          Text(
            "Login with your details",
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20,),

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
                    if (_formkey.currentState!.validate()) {


                      setState(() {
                        _loading = true;
                      });
                      final User? user =
                          (await _authData.register(emailController.text, passwordController.text))
                              ?.user;

                      if (user != null) {
                        setState(() {
                          _loading = false;
                        });


                        _authData.createUser(
                            id: user.uid, password: passwordController.text, email: emailController.text);
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) {
                          return HomeScreen();
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
                                //Text(_authData.error),
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
