import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ungserviceofficer/states/login.dart';

void main() {
  HttpOverrides.global = MyHttpOverride();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Login(),
    );
  }
}

class MyHttpOverride extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    // TODO: implement createHttpClient
    return super.createHttpClient(context)
      ..badCertificateCallback = (cert, host, port) => true;
  }
}
