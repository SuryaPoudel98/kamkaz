// ignore_for_file: file_names, prefer_const_constructors, avoid_print, non_constant_identifier_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:kaamkaaz/api/Connection.dart';
import 'package:kaamkaaz/api/LoginApi.dart';
import 'package:kaamkaaz/api/SharedServices1.dart';
import 'package:kaamkaaz/model/LoginResponse.dart';
import 'package:kaamkaaz/view/Home.dart';
import 'package:kaamkaaz/view/Register.dart';

// ignore: depend_on_referenced_packages
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    // Connection.setConncetion();
    super.initState();
  }

  late LoginResponse loginResponse;
  bool inlogginspinner = false;
  bool connection = true;
  String branch = 'j';
  Color loginButton = Color(0xff164482);

  final email = TextEditingController();
  final password = TextEditingController();

  Color _color = Color(0xffB38851);
  Color text1 = Color(0xffffffff);
  Color text2 = Color(0xffB38851);
  Color _color1 = Colors.white;
  bool emailempty = false;
  bool passwordempty = false;

  Color emailBorder = Color(0xffEFE8E8);
  Color passwordBorder = Color(0xffEFE8E8);
  ScrollController listScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final ScrollController controller = ScrollController();
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color(0xff164482)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: ModalProgressHUD(
          color: Colors.white,
          inAsyncCall: inlogginspinner,
          child: ListView(
            reverse: true,
            controller: controller,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(54, 17, 54, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Align(
                    //     alignment: Alignment.centerLeft,
                    //     child: IconButton(
                    //         onPressed: () {},
                    //         icon: Icon(
                    //           Icons.arrow_back,
                    //           color: Color(0xff164482),
                    //         ))),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    Image.asset(
                      'assets/kamkaaz.png',
                      height: 55,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                        child: Text(
                      'Login',
                      style: TextStyle(fontSize: 32, fontFamily: 'Poppins'),
                    )),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          color: _color,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(
                                  color: Color(0xffB38851), width: 2)),
                          onPressed: () {
                            setState(() {
                              _color = Color(0xffB38851);
                              _color1 = Color.fromARGB(221, 250, 244, 244);
                              text1 = Colors.white;
                              text2 = Color(0xffB38851);
                              branch = 'j';
                              loginButton = Color(0xff164482);
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
                        SizedBox(
                          width: 20,
                        ),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(
                                  color: Color(0xffB38851), width: 1)),
                          onPressed: () {
                            setState(() {
                              _color = Colors.white;
                              _color1 = Color(0xffB38851);
                              text1 = Color(0xffB38851);
                              text2 = Colors.white;
                              branch = 'e';
                              loginButton = Color(0xff2F72CB);
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
                    SizedBox(
                      height: 48,
                    ),
                    Textfield(
                        hint: 'Enter yours email',
                        iconn: Icon(Icons.mark_email_unread),
                        obsecur: false,
                        controller: email,
                        borderColor: emailBorder,
                        ontap: () {
                          setState(() {
                            emailBorder = Color(0xffEFE8E8);
                            emailempty = false;
                          });
                        }),
                    Errorlabel(
                        errorlabel: 'enter your valid email',
                        visibale: emailempty),
                    Textfield(
                        hint: 'Enter your password ',
                        iconn: Icon(Icons.lock),
                        obsecur: true,
                        controller: password,
                        borderColor: passwordBorder,
                        ontap: () {
                          setState(() {
                            passwordBorder = Color(0xffEFE8E8);
                            passwordempty = false;
                          });
                        }),
                    Errorlabel(
                        errorlabel: 'enter your password',
                        visibale: passwordempty),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onPressed: () async {
                        await Connection.setConncetion();
                        setState(() {
                          connection = Connection.connection;
                        });
                        if (email.text.toString().isNotEmpty &&
                            password.text.toString().isNotEmpty &&
                            email.text.toString().contains('@')) {
                          if (Connection.connection) {
                            setState(() {
                              inlogginspinner = true;
                            });
                            if (branch == 'e') {
                              await loginApi()
                                  .loginEmployeer(LoginRequestModel(
                                      email: email.text.toString(),
                                      password: password.text.toString()))
                                  .then((value) {
                                if (value.status == true) {
                                  setState(() {
                                    inlogginspinner = false;
                                  });

                                  sharedPref.setUserLogin(
                                      value.UserId, value.name);
                                  setState(() {
                                    sharedPref.islog = true;
                                  });
                                  Navigator.pushNamed(context, '/Home');
                                } else {
                                  setState(() {
                                    inlogginspinner = false;
                                  });
                                  showDialog(
                                      context: context,
                                      builder: (_) => AlertDialog(
                                            title: Text('Error occur'),
                                            content: Text(value.message),
                                          ));
                                }
                              });
                            } else {
                              loginApi()
                                  .loginJobseeker(LoginRequestModel(
                                      email: email.text.toString(),
                                      password: password.text.toString()))
                                  .then((value) async {
                                if (value.status == true) {
                                  setState(() {
                                    inlogginspinner = false;
                                  });

                                  await sharedPref.setUserLogin(
                                      value.UserId, value.name);
                                  setState(() {
                                    sharedPref.islog = true;
                                  });
                                  // ignore: use_build_context_synchronously
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              Home()),
                                      (Route<dynamic> route) => false);
                                } else {
                                  setState(() {
                                    inlogginspinner = false;
                                  });
                                  showDialog(
                                      context: context,
                                      builder: (_) => AlertDialog(
                                            title: Text('Error occur'),
                                            content: Text(value.message),
                                          ));
                                }
                              });
                            }
                          }
                        } else {
                          //   if (!connection) {
                          //     showDialog(
                          //         context: context,
                          //         builder: (_) => AlertDialog(
                          //               title: Text('Error occur'),
                          //               content: Text(
                          //                   'Error occur with internet conncetion'),
                          //             ));
                          //   }
                          if (email.text.toString().isEmpty ||
                              !email.text.toString().contains('@')) {
                            setState(() {
                              emailempty = true;
                              emailBorder = Colors.red;
                            });
                          }
                          if (password.text.toString().isEmpty) {
                            setState(() {
                              passwordempty = true;
                              passwordBorder = Colors.red;
                            });
                          }
                        }
                      },
                      color: loginButton,
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              'Login  ',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontFamily: 'Poppins'),
                            ),
                            Icon(
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
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forget password?',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            decoration: TextDecoration.underline,
                          ),
                        )),
                    Row(children: <Widget>[
                      Expanded(
                        child: Container(
                            margin:
                                const EdgeInsets.only(left: 10.0, right: 20.0),
                            child: Divider(
                              color: Colors.grey,
                              height: 36,
                            )),
                      ),
                      Text(
                        "OR",
                        style: TextStyle(fontFamily: 'Poppins'),
                      ),
                      Expanded(
                        child: Container(
                            margin:
                                const EdgeInsets.only(left: 20.0, right: 10.0),
                            child: Divider(
                              color: Colors.grey,
                              height: 36,
                            )),
                      ),
                    ]),
                    SizedBox(
                      height: 22,
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(
                              color: Color(0xff164482),
                              width: 1,
                              style: BorderStyle.solid)),
                      onPressed: () {
                        Navigator.restorablePushNamed(context, '/Register');
                      },
                      color: Color(0xffffffff),
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              'Sign Up',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue,
                                  fontFamily: 'Poppins'),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
