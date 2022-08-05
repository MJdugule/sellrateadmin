import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sellsrateadmin/constants.dart';
import 'package:sellsrateadmin/providers/auth_provider.dart';
import 'package:sellsrateadmin/screens/home/homescreen.dart';
import 'package:sellsrateadmin/services/user_service.dart';
import 'package:sellsrateadmin/widget/apptext_field.dart';
import 'package:sellsrateadmin/widget/no_account_text.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController firstnameController = TextEditingController();
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
            "Login",
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
            controller: firstnameController,
            validator: (email) {
              if (email!.isEmpty) {
                return 'Email field cannot be empty';
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
            hintText: 'Password',
            controller: passwordController,
            validator: (confirm) {
              if (confirm!.isEmpty) {
                return 'Password field cannot be empty';
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
      UserService().getAdminCredentials(firstnameController.text).then((value) async {
        if(value.exists){
          if(value['firstName'] == firstnameController.text){
            if(value['password']== passwordController.text){


              try{
                UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
                if(userCredential != null){
                  EasyLoading.dismiss();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) {
                   return HomeScreen();
                  })));
                }
               
              }catch(e){
                 EasyLoading.dismiss();
                UserService().showMyDialog(
                  context: context,
                  title: 'Login',
                  message: '${e.toString()}'
                );
                
              }
              return;
            }
            EasyLoading.dismiss();
                UserService().showMyDialog(
            context: context,
            title: 'Incorrect Password',
            message: 'Password you have entered is invalid'
          );
            return;
          }
          EasyLoading.dismiss();
                UserService().showMyDialog(
            context: context,
            title: 'Invalid Username',
            message: 'Username you have entered is incorrect'
          );
        }
         EasyLoading.dismiss();
                UserService().showMyDialog(
            context: context,
            title: 'Invalid Username',
            message: 'Username you have entered is incorrect'
          );
      });

                    } else {
                     
                      EasyLoading.dismiss();
                     
                    }
                  },
                  child: Text(
                    'Login',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontStyle: FontStyle.normal,
                      color: Colors.white,
                    ),
                  )),

                 
            ),
          ),
          SizedBox(height: 20,),
           NoAccountText()
        ],
      ),
    );
  }
}
