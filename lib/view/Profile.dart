// ignore_for_file: prefer_const_constructors, deprecated_member_use, file_names

import 'package:flutter/material.dart';
import 'package:kaamkaaz/api/Connection.dart';
import 'package:kaamkaaz/api/SharedServices1.dart';
// ignore: depend_on_referenced_packages
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kaamkaaz/view/MoreScreens.dart';
import 'package:kaamkaaz/view/applied.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
    sharedPref.setislogged();
    sharedPref.getUsername();
  }

  @override
  build(BuildContext context) {
    return SafeArea(
      child: !(sharedPref.islog)
          ? MoreScreens()
          : Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(
                      'assets/kamkaaz.png',
                      height: 55,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Hello ${sharedPref.userName}",
                      style: TextStyle(fontFamily: 'Poppins', fontSize: 19),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Divider(
                      color: Color(0xffA79E9E),
                    ),
                    MaterialButton(
                      onPressed: () => {Navigator.pushNamed(context, '/Home')},
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                        child: Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Icon(
                              Icons.help_sharp,
                              color: Color(0xffC59C69),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Find Jobs',
                              style: TextStyle(
                                  color: Color(0xff746F6F),
                                  fontSize: 20,
                                  fontFamily: 'Poppins'),
                            )
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      color: Color(0xffA79E9E),
                    ),
                    MaterialButton(
                      onPressed: () => {},
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                        child: Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Icon(
                              Icons.settings_outlined,
                              color: Color(0xffC59C69),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Account Settings',
                              style: TextStyle(
                                  color: Color(0xff746F6F),
                                  fontSize: 20,
                                  fontFamily: 'Poppins'),
                            )
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      color: Color(0xffA79E9E),
                    ),
                    MaterialButton(
                      onPressed: () async {
                        await Connection.setConncetion();
                        Connection.connection
                            // ignore: use_build_context_synchronously
                            ? Navigator.pushNamed(context, '/Bookmarks')
                            : Fluttertoast.showToast(
                                msg: "you have no internet conncetion ",
                              );
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                        child: Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Icon(
                              Icons.bookmark_sharp,
                              color: Color(0xffC59C69),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Bookmarks',
                              style: TextStyle(
                                  color: Color(0xff746F6F),
                                  fontSize: 20,
                                  fontFamily: 'Poppins'),
                            )
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      color: Color(0xffA79E9E),
                    ),
                    MaterialButton(
                      onPressed: () async {
                        await Connection.setConncetion();
                        Connection.connection
                            // ignore: use_build_context_synchronously
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Applied()),
                              )
                            : Fluttertoast.showToast(
                                msg: "you have no internet conncetion ",
                              );
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                        child: Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Icon(
                              Icons.done_all,
                              color: Color(0xffC59C69),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'applied job',
                              style: TextStyle(
                                  color: Color(0xff746F6F),
                                  fontSize: 20,
                                  fontFamily: 'Poppins'),
                            )
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      color: Color(0xffA79E9E),
                    ),
                  ]),
            ),
    );
  }
}
