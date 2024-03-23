// ignore: duplicate_ignore
// ignore_for_file: unused_local_variable, unused_element, non_constant_identifier_names, duplicate_ignore, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goorani/models/colorstyle.dart';
import 'package:goorani/Login/phonenumber.dart';
import '../models/Controller.dart';

class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);
  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Controller c = Get.put(Controller());
    return Scaffold(
      backgroundColor: ColorStyle().colorDark,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: _Logo_App()),
            _Get_Starts(),
          ],
        ),
      ),
    );
  }
}

Widget _Logo_App() {
  return Align(
    alignment: FractionalOffset.center,
    child: Text(
      'GOORANI',
      textAlign: TextAlign.center,
      style: TextStyle(
          fontFamily: 'DancingScript',
          fontSize: 64,
          color: ColorStyle().colorYellow),
    ),
  );
}

// ignore: non_constant_identifier_names
Widget _Get_Starts() {
  return Align(
    alignment: FractionalOffset.bottomCenter,
    child: Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () {
              Get.to(const PhoneNumber());
            },
            style: ElevatedButton.styleFrom(
              primary: ColorStyle().colorYellow,
              elevation: 32,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              minimumSize: const Size(double.infinity, 45), //////// HERE
            ),
            child: Text(
              'GET STARTES',
              textAlign: TextAlign.center,
              style: TextStyle(color: ColorStyle().colorDark),
            ),
          ),
        ],
      ),
    ),
  );
}
