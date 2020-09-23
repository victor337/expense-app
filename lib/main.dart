import 'package:expense_app/bindings/base_binding.dart';
import 'package:expense_app/views/base/base_screen.dart';
import 'package:expense_app/views/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async{
  GetStorage.init();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      theme: ThemeData(
        primaryColor: const Color(0xff1abc9c),
        accentColor: const Color(0xff1abc9c),
        appBarTheme: const AppBarTheme(
          elevation: 0
        ),
      ),
      defaultTransition: Transition.rightToLeft,
      getPages: [
        GetPage(
          name: '/splash',
          page: () => SplashScreen(),
          binding: AllBinding(),
        ),
        GetPage(
          name: '/base',
          page: () => BaseScreen(),
          binding: AllBinding(),
        ),
      ],
    ),
  );
}