import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ungserviceofficer/states/login.dart';
import 'package:ungserviceofficer/states/main_home.dart';
import 'package:ungserviceofficer/states/queue.dart';
import 'package:ungserviceofficer/states/read_qr.dart';
import 'package:ungserviceofficer/states/visit.dart';
import 'package:ungserviceofficer/utility/my_constant.dart';

var getPages = <GetPage<dynamic>>[
  GetPage(
    name: '/login',
    page: () => const Login(),
  ),
  GetPage(
    name: '/mainHome',
    page: () => const MainHome(),
  ),
  GetPage(
    name: '/readQR',
    page: () => const ReadQR(),
  ),
  GetPage(
    name: '/visit',
    page: () => const Visit(),
  ),
  GetPage(
    name: '/queue',
    page: () => const Queue(),
  ),
];

String initialRoute = '/login';

Future<void> main() async {
  HttpOverrides.global = MyHttpOverride();

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var datas = preferences.getStringList('data');
  print('datas = $datas');

  if (datas != null) {
    initialRoute = '/mainHome';
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: getPages,
      initialRoute: initialRoute,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        appBarTheme: AppBarTheme(
          backgroundColor: MyConstant.bgColor,
          foregroundColor: MyConstant.dark,
          elevation: 0,
        ),
      ),
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
