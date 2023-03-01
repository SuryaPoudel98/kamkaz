// ignore_for_file: file_names

import 'dart:io';

class Connection {
  static late bool connection;
  // ignore: non_constant_identifier_names
  static Future CheckInternetConncetion() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        connection = true;
      }
    } on SocketException catch (_) {
      connection = false;
    }
  }

  static setConncetion() async {
    await CheckInternetConncetion();
  }
}
