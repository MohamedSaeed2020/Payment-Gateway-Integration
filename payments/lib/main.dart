import 'package:flutter/material.dart';
import 'package:payments/modules/register/register.dart';
import 'package:payments/shared/network/dio_helper.dart';

void main() async {
  //init dio helper
  await DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterScreen(),
    );
  }
}
