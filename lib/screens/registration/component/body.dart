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
  final TextEditingController numberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
        TextEditingController dobController = TextEditingController();
  final TextEditingController lgaController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController townController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  DateTime _birth = DateTime.now();
  String? code;

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
                "Welcome",
                style: headingStyle,
              ),Text(
                "Please complete your details",
                style: GoogleFonts.poppins(),
              ),
             
              SizedBox(height: 20,),

          dobField(date),
          AppTextField(
            obstrust: false,
            hintText: 'Country',
            controller: countryController,
            validator: (country) {
              if (country!.isEmpty) {
                return 'This field cannot be empty';
              }
    
              return null;
            },
          ),
          AppTextField(
            obstrust: false,
            hintText: 'State',
            controller: stateController,
            validator: (state) {
              if (state!.isEmpty) {
                return 'This field cannot be empty';
              }
    
              return null;
            },
          ),
          AppTextField(
            obstrust: false,
            hintText: 'LGA',
            controller: lgaController,
            validator: null,
          ),
          AppTextField(
            obstrust: false,
            hintText: 'Town/City',
            controller: townController,
            validator: (town) {
              if (town!.isEmpty) {
                return 'This field cannot be empty';
              }
    
              return null;
            },
          ),
          AppTextField(
            obstrust: false,
            hintText: 'Full Address',
            controller: addressController,
            validator: (address) {
              if (address!.isEmpty) {
                return 'This field cannot be empty';
              }
    
              return null;
            },
          ),
          phoneInput(),
          SizedBox(height: 20,),
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
                                     var first = await storage.read(key: 'firstname');
                                  EasyLoading.show();
                     

                                User? user= FirebaseAuth.instance.currentUser;

                                if (user != null) {
                                    EasyLoading.dismiss();

                    
                                      _authData.updateUser(
                                        firstName: first,
                                        dob: dobController.text,
                                        lga: lgaController.text,
                                        state: stateController.text,
                                        number: numberController.text,
                                        address: addressController.text, country: countryController.text,
                                          id: user.uid, );
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) {
                                        return HomeScreen();
                                      })));
                                 
                                } else {
                                  EasyLoading.dismiss();
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          backgroundColor: Colors.black87,
                                          duration: Duration(seconds: 5),
                                          content: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(_authData.error, style: TextStyle(color: Colors.white),),
                                              Icon(
                                                Icons.cancel_outlined,
                                                color: Colors.red,
                                                size: 26,
                                              )
                                            ],
                                          )));
                                }
                              } else {
                                      EasyLoading.dismiss();
                                //scaffoldMessage('Please complete all field');
                              }
                          },
                          child: Text(
                            'Save',
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

  Widget phoneInput() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7, horizontal: 20),
      child: Container(
       
        child: IntlPhoneField(
          onSubmitted: (p0) {
            print(p0);
            //  (value) {
            // print('$code${numberController.text}');
            // setState(() {
            //   code = value.toString();
            //   errorphone = null;
            //   erroremail = null;
            //   erroruser = null;
            // });
          },
          onCountryChanged: (value) {
            setState(() {
              numberController.clear();
            });
          },
          onChanged: (value) {
            // print('$code${numberController.text}');
            setState(() {
              code = value.countryCode.toString();
            });
          },
          controller: numberController,
          validator: (number) {
            if (numberController.text.isEmpty) {
              return 'Number field cannot be empty';
            } else if (numberController.text
                .contains(RegExp(r"[a-zA-Z+_.-]"))) {
              return 'You can only type numbers';
            }
            return null;
          },
          dropdownTextStyle: TextStyle(
              fontFamily: 'PoppinsMedium',
              fontSize: 14,
              fontWeight: FontWeight.w300),
          initialCountryCode: 'NG',
          dropdownIconPosition: IconPosition.leading,
          showCountryFlag: false,
          disableLengthCheck: true,
          decoration: InputDecoration(
            isDense: true,
            //  errorText: errorphone,
            contentPadding: const EdgeInsets.fromLTRB(13, 0, 0, 0),
            hintText: 'Phone no',
            hintStyle: TextStyle(
                color: Colors.grey[500],
                fontFamily: 'PoppinsMedium',
                fontSize: 14),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF999999)),
                // ignore: unnecessary_const
                borderRadius: BorderRadius.all(const Radius.circular(6))),
            focusedBorder: const OutlineInputBorder(
                //borderSide: BorderSide(color: mainColor),
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
      ),
    );
  }

  Widget dobField(date) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: ((context) {
              return Dialog(
                child: SizedBox(
                  height: 260,
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        child: CupertinoDatePicker(
                            use24hFormat: true,
                            mode: CupertinoDatePickerMode.date,
                            initialDateTime: _birth,
                            onDateTimeChanged: (DateTime value) {
                              setState(() {
                                _birth = value;
                                dobController.text = date;
                              });
                            }),
                      ),
                      TextButton(
                          style: ElevatedButton.styleFrom(
                            onSurface: Colors.white,
                            primary: Colors.black, //background color of button
                            elevation: 8, //elevation of button
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
                          ),
                          onPressed: () async {
                            setState(() {
                              dobController.text = date;
                            });
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Done',
                            style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontStyle: FontStyle.normal,
                                color: Colors.white,
                                decoration: TextDecoration.underline),
                          ))
                    ],
                  ),
                ),
              );
            }));
      },
      child: AppTextField(
        enabled: false,
        obstrust: false,
        hintText: 'Date of birth',
        controller: dobController,
        validator: (dob) {
          // final bool _isValid =
          //     EmailValidator.validate(
          //         emailController.text);
          if (dob!.isEmpty) {
            return 'field cannot be empty';
          }
          // else if (!_isValid) {
          //   return 'Invalid email';
          // }
          return null;
        },
      ),
    );
  }
}
