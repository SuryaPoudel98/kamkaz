// ignore_for_file: file_names, deprecated_member_use, avoid_print, must_be_immutable, use_build_context_synchronously, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kaamkaaz/api/Connection.dart';
import 'package:kaamkaaz/api/RegisterApi.dart';
// ignore: import_of_legacy_library_into_null_safe, depend_on_referenced_packages
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../model/Register_model.dart';
import 'package:kaamkaaz/api/SharedServices1.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  void initState() {
    Connection.setConncetion();
    super.initState();
  }

  bool connection = true;
  bool showSpinner = false;
  String passworderror = ' ';
  String nameofuser = '';
  String emailofuser = '';
  String passwordofuser = '';
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final password2 = TextEditingController();
  final contact = TextEditingController();
  Color _color = const Color(0xffB38851);
  Color text1 = const Color(0xffffffff);
  Color text2 = const Color(0xffB38851);
  // ignore: use_full_hex_values_for_flutter_colors
  Color _color1 = const Color(0xFFFFFF);
  bool nameempty = false;
  bool emailempty = false;
  bool passwordempty = false;
  bool passwordmimatch = false;
  Color nameBorder = const Color(0xffEFE8E8);
  Color emailBorder = const Color(0xffEFE8E8);
  Color passwordBorder = const Color(0xffEFE8E8);
  Color mismatchBorder = const Color(0xffEFE8E8);
  Color contactColor = const Color(0xffEFE8E8);
  String status = 'j';
  bool conatctempty = false;
  Color SignupButton = const Color(0xff164482);
  ScrollController listScrollController = ScrollController();
  bool issamepassword(String string1, String string2) {
    if (string1.compareTo(string2) == 0) {
      return true;
    } else {
      return false;
    }
  }

  bool ispasswordcontain(String string1) {
    if (string1.contains('@') && string1.length >= 6) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xff164482)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: ModalProgressHUD(
            color: Colors.white,
            inAsyncCall: showSpinner,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(31, 5, 31, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Center(
                      child: Text(
                        'SignUp ',
                        style: TextStyle(fontSize: 32, fontFamily: 'Poppins'),
                      ),
                    ),
                    const SizedBox(
                      height: 41,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          color: _color,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: const BorderSide(
                                  color: Color(0xffB38851), width: 2)),
                          onPressed: () {
                            setState(() {
                              _color = const Color(0xffB38851);
                              _color1 =
                                  const Color.fromARGB(221, 250, 244, 244);
                              text1 = Colors.white;
                              text2 = const Color(0xffB38851);
                              status = 'j';
                              SignupButton = const Color(0xff164482);
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Jobseeker',
                              style: TextStyle(
                                  color: text1, fontFamily: 'Poppins'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: const BorderSide(
                                  color: Color(0xffB38851), width: 1)),
                          onPressed: () {
                            setState(() {
                              _color = const Color(0xffffffff);
                              _color1 = const Color(0xffB38851);
                              text1 = const Color(0xffB38851);
                              text2 = Colors.white;
                              status = 'E';
                              SignupButton = const Color(0xff2F72CB);
                            });
                          },
                          color: _color1,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Employeer',
                              style: TextStyle(
                                  color: text2, fontFamily: 'Poppins'),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                    TextField(
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.words,
                        controller: name,
                        onTap: () {
                          setState(() {
                            nameBorder = const Color(0xffEFE8E8);
                            nameempty = false;
                          });
                        },
                        obscureText: false,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.person),
                            fillColor: const Color(0xffEFE8E8),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide:
                                    BorderSide(color: nameBorder, width: 0.0)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                    color: Color(0xff8B7676), width: 0.0)),
                            hintText: 'Enter Your Name')),
                    Errorlabel(
                      errorlabel: 'plase enter your name',
                      visibale: nameempty,
                    ),
                    Textfield(
                      hint: 'Enter  Email Address',
                      obsecur: false,
                      controller: email,
                      iconn: const Icon(
                        Icons.mark_email_unread_outlined,
                      ),
                      borderColor: emailBorder,
                      ontap: () {
                        setState(() {
                          emailBorder = const Color(0xffEFE8E8);
                          emailempty = false;
                        });
                      },
                    ),
                    Errorlabel(
                        errorlabel: 'Plase enter your valid email',
                        visibale: emailempty),
                    TextField(
                      controller: contact,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xffEFE8E8),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide:
                                  BorderSide(color: contactColor, width: 0.0)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                  color: Color(0xff8B7676), width: 0.0)),
                          prefixIcon: const Icon(Icons.phone),
                          hintText: "Enter your conatct number"),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      onTap: () {
                        setState(() {
                          contactColor = const Color(0xffEFE8E8);
                          conatctempty = false;
                        });
                      },
                    ),
                    Errorlabel(
                        errorlabel: 'Enter your contact number plz',
                        visibale: conatctempty),
                    Textfield(
                      hint: 'Enter Your Password',
                      obsecur: true,
                      controller: password,
                      iconn: const Icon(
                        Icons.lock,
                      ),
                      borderColor: passwordBorder,
                      ontap: () {
                        setState(() {
                          passwordBorder = const Color(0xffEFE8E8);
                          passwordempty = false;
                          passworderror = '';
                        });
                      },
                    ),
                    Errorlabel(
                        errorlabel: passworderror, visibale: passwordempty),
                    Textfield(
                      hint: 'Enter Your Password',
                      obsecur: true,
                      controller: password2,
                      iconn: const Icon(
                        Icons.lock,
                      ),
                      borderColor: mismatchBorder,
                      ontap: () {
                        setState(() {
                          mismatchBorder = const Color(0xffEFE8E8);
                          passwordmimatch = false;
                        });
                      },
                    ),
                    Errorlabel(
                        errorlabel: 'password mismatch',
                        visibale: passwordmimatch),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onPressed: () {
                        nameofuser = name.text.toString().trim();
                        emailofuser = email.text.toLowerCase();
                        passwordofuser = password.text.toString();
                        Connection.setConncetion();
                        setState(() {
                          connection = Connection.connection;
                        });
                        if (nameofuser.isNotEmpty &&
                            emailofuser.isNotEmpty &&
                            passwordofuser.isNotEmpty &&
                            ispasswordcontain(passwordofuser) &&
                            issamepassword(
                                passwordofuser, password2.text.toString()) &&
                            contact.toString().isNotEmpty &&
                            connection) {
                          if (connection) {
                            setState(() {
                              showSpinner = true;
                            });
                            if (status == 'j') {
                              print('jobseeker');
                              RegisterApi()
                                  .RegisterJobseeker(RegisterRequestModel(
                                      name: nameofuser,
                                      email: emailofuser,
                                      password: passwordofuser,
                                      phonenumber: contact.text.toString()))
                                  .then((value) async {
                                setState(() {
                                  showSpinner = false;
                                });
                                if (value.status == true) {
                                  print('sucessfull');
                                  await sharedPref.setUserLogin(
                                      value.UserId, value.UserName);
                                  sharedPref.islog = true;
                                  Navigator.pushNamed(context, '/Home');
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (_) => AlertDialog(
                                            title: const Text('Error occur'),
                                            content: Text(value.message),
                                          ));
                                }
                              });
                            } else {
                              RegisterApi()
                                  .ResgiterEmpolyer(RegisterRequestModel(
                                      name: nameofuser,
                                      email: emailofuser,
                                      password: passwordofuser,
                                      phonenumber: contact.text.toString()))
                                  .then((value) async {
                                setState(() {
                                  showSpinner = false;
                                });
                                if (value.status == true) {
                                  print('sucessfull');
                                  await sharedPref.setUserLogin(
                                      value.UserId, value.UserName);
                                  sharedPref.islog = true;
                                  Navigator.pushNamed(context, '/Home');
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (_) => AlertDialog(
                                            title: const Text('Error occur'),
                                            content: Text(value.message),
                                          ));
                                }
                              });
                            }
                          }
                        } else {
                          if (nameofuser.isEmpty) {
                            nameempty = true;
                            nameBorder = Colors.red;
                          }
                          if (emailofuser.isEmpty ||
                              !emailofuser.contains("@")) {
                            emailempty = true;
                            emailBorder = Colors.red;
                          }
                          if (passwordofuser.isEmpty) {
                            passwordempty = true;
                            passwordBorder = Colors.red;
                            passworderror = 'enter your password';
                          } else if (!ispasswordcontain(passwordofuser)) {
                            passwordempty = true;
                            passwordBorder = Colors.red;
                          }
                          if (!issamepassword(
                              passwordofuser, password2.text.toString())) {
                            passwordmimatch = true;
                            mismatchBorder = Colors.red;
                          }
                          if (contact.text.isEmpty) {
                            contactColor = Colors.red;
                            conatctempty = true;
                          }
                        }
                        // ignore: empty_statements
                      },
                      color: SignupButton,
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Text(
                              'Sign Up',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontFamily: 'Poppins'),
                            ),
                            const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                    Errorlabel(
                        errorlabel: 'you have no internet conncetion',
                        visibale: !connection),
                    Row(children: <Widget>[
                      Expanded(
                        child: Container(
                            margin:
                                const EdgeInsets.only(left: 10.0, right: 20.0),
                            child: const Divider(
                              color: Colors.grey,
                              height: 36,
                            )),
                      ),
                      const Text(
                        "OR",
                        style: TextStyle(fontFamily: 'Poppins'),
                      ),
                      Expanded(
                        child: Container(
                            margin:
                                const EdgeInsets.only(left: 20.0, right: 10.0),
                            child: const Divider(
                              color: Colors.grey,
                              height: 30,
                            )),
                      ),
                    ]),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(31, 0, 15, 20),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Already have an account?',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/Login');
                                  },
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 18,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ))
                            ]),
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}

class Errorlabel extends StatelessWidget {
  String errorlabel;
  Errorlabel({Key? key, required this.errorlabel, required this.visibale})
      : super(key: key);

  final bool visibale;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visibale,
      replacement: const SizedBox(
        height: 33,
      ),
      child: SizedBox(
        height: 33,
        child: Text(errorlabel, style: const TextStyle(color: Colors.red)),
      ),
    );
  }
}

class Textfield extends StatelessWidget {
  final bool obsecur;
  final String hint;
  final TextEditingController controller;
  final Icon iconn;
  final Color borderColor;
  final Function ontap;
  // ignore: use_key_in_widget_constructors
  const Textfield(
      {required this.hint,
      required this.iconn,
      required this.obsecur,
      required this.controller,
      required this.borderColor,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return TextField(
        keyboardType: TextInputType.text,
        controller: controller,
        onTap: () {
          ontap();
        },
        obscureText: obsecur,
        decoration: InputDecoration(
            prefixIcon: iconn,
            fillColor: const Color(0xffEFE8E8),
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: borderColor, width: 0.0)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:
                    const BorderSide(color: Color(0xff8B7676), width: 0.0)),
            hintText: hint));
  }
}
