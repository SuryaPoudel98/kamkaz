// ignore_for_file: depend_on_referenced_packages, file_names

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// ignore: camel_case_types
class sharedPref {
  // ignore: non_constant_identifier_names
  static String? Userid;
  static String? userName;
  static late bool islog;
  static setislogged() async {
    await sharedPref.isLoggedin();
  }

  static const storage = FlutterSecureStorage();
  static Future<void> setUserLogin(String id, String name) async {
    await storage.write(key: 'id', value: id);
    await storage.write(key: 'name', value: name);
    await storage.write(key: 'loggedin', value: 'true');
    Userid = id;
    userName = name;
  }

  static isLoggedin() async {
    if (await storage.read(key: 'loggedin') == 'true') {
      islog = true;
    } else {
      islog = false;
    }
  }

  static getUserid() async {
    Userid = await storage.read(key: 'id');
  }

  static getUsername() async {
    userName = await storage.read(key: 'name');
  }

  static deleteData() async {
    await storage.deleteAll();
    islog = false;
  }
}
