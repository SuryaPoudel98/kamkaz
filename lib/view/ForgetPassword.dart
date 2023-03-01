// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kaamkaaz/view/Register.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(52, 186, 52, 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                  child: SizedBox.fromSize(
                      size: Size.fromRadius(50),
                      child: FittedBox(
                        child: Icon(
                          Icons.lock,
                          color: Color(0xffB38851),
                        ),
                      ))),
              SizedBox(
                height: 15,
              ),
              Text(
                'Forget Password? ',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Provide your account’s for which you ',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'want to reset your password!',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 15,
              ),
              Textfield(
                  hint: 'Enter your email here',
                  iconn: Icon(
                    Icons.email,
                    color: Colors.blue,
                  ),
                  obsecur: false,
                  controller: emailController,
                  borderColor: Colors.white,
                  ontap: () {}),
              SizedBox(
                height: 25,
              ),
              // ignore: deprecated_member_use
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                onPressed: () {},
                color: Color(0xff164482),
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        'Next  ',
                        style: TextStyle(fontSize: 20, color: Colors.white),
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
      ),
    ));
  }
}
