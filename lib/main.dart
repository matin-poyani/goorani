import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goorani/screen/home.dart';

void main() => runApp(const GetMaterialApp(home: Home()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home: Home(),
    );
  }
}
