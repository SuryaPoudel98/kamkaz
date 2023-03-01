// ignore_for_file: deprecated_member_use, file_names

import 'package:flutter/material.dart';
import 'package:kaamkaaz/api/SharedServices1.dart';

class MoreScreens extends StatefulWidget {
  const MoreScreens({Key? key}) : super(key: key);

  @override
  State<MoreScreens> createState() => _MoreScreensState();
}

class _MoreScreensState extends State<MoreScreens> {
  isloged() async {
    await sharedPref.isLoggedin();
  }

  @override
  void initState() {
    super.initState();
    isloged();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
        child: Column(children: [
          Image.asset(
            'assets/kamkaaz.png',
            height: 55,
          ),
          const SizedBox(
            height: 50,
          ),
          const Divider(
            color: Color(0xffA79E9E),
          ),
          MaterialButton(
            hoverColor: Colors.transparent,
            onPressed: () => {},
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Icon(
                    Icons.help_sharp,
                    color: Color(0xffC59C69),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    'HELP & SUPPORT',
                    style: TextStyle(
                        color: Color(0xff746F6F),
                        fontSize: 20,
                        fontFamily: 'Poppins'),
                  )
                ],
              ),
            ),
          ),
          const Divider(
            color: Color(0xffA79E9E),
          ),
          MaterialButton(
            onPressed: () => {},
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Icon(
                    Icons.settings_outlined,
                    color: Color(0xffC59C69),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    'SETTING & PRIVACY',
                    style: TextStyle(
                        color: Color(0xff746F6F),
                        fontSize: 20,
                        fontFamily: 'Poppins'),
                  )
                ],
              ),
            ),
          ),
          const Divider(
            color: Color(0xffA79E9E),
          ),
          MaterialButton(
            onPressed: () async {},
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Icon(
                    Icons.pages,
                    color: Color(0xffC59C69),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    'TERMS & CONDITION',
                    style: TextStyle(
                        color: Color(0xff746F6F),
                        fontSize: 20,
                        fontFamily: 'Poppins'),
                  )
                ],
              ),
            ),
          ),
          const Divider(
            color: Color(0xffA79E9E),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Visibility(
              visible: sharedPref.islog,
              replacement: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/Login');
                },
                color: const Color(0xff164482),
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      // ignore: prefer_const_constructors
                      Text(
                        'Login  ',
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: 'Poppins'),
                      ),
                      // ignore: prefer_const_constructors
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                onPressed: () async {
                  sharedPref.deleteData();
                  setState(() {
                    sharedPref.islog = false;
                  });
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/Home', (Route<dynamic> route) => false);
                },
                color: const Color(0xff164482),
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        'Logout  ',
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
            ),
          ),
        ]),
      ),
    );
  }
}
