// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:goorani/Login/sendcode.dart';
import '../models/Controller.dart';
import '../models/colorstyle.dart';

class PhoneNumber extends StatefulWidget {
  const PhoneNumber({Key? key}) : super(key: key);

  @override
  State<PhoneNumber> createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final Controller c = Get.put(Controller());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const ColorStyle().colorDark,
        leading: const BackButton(color: Colors.white),
      ),
      backgroundColor: const ColorStyle().colorDark,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, top: 32),
              child: const Text(
                'To continue enter',
                textAlign: TextAlign.start,
                style: TextStyle(
                    // fontFamily: 'DancingScript',
                    fontSize: 32,
                    color: Colors.white),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: const Text(
                'your phone number',
                textAlign: TextAlign.start,
                style: TextStyle(
                    // fontFamily: 'DancingScript',
                    fontSize: 32,
                    color: Colors.white),
              ),
            ),
            _phoneNumber(),
            _Continue(),
          ],
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget _Continue() {
  return Align(
    alignment: FractionalOffset.bottomCenter,
    child: Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              // TODO check phone number...
              Get.to(const SendCode());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const ColorStyle().colorYellow,
              elevation: 32,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              minimumSize: const Size(double.infinity, 45), //////// HERE
            ),
            child: Text(
              'CONTINUE',
              textAlign: TextAlign.center,
              style: TextStyle(color: const ColorStyle().colorDark),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _phoneNumber() {
  return Directionality(
    textDirection: TextDirection.ltr,
    child: Container(
      padding: const EdgeInsets.all(32),
      margin: const EdgeInsets.only(top: 64),
      child: TextFormField(
        style: const TextStyle(color: Colors.white),
        // controller: TextEditingController(text: "+98"),
        decoration: const InputDecoration(
          hintText: 'Phone',
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(
            Icons.phone_android,
            color: Colors.grey,
          ),
          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.zero,
          // ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(11),
        ], // Only numbers can be entered
      ),
    ),
  );
}
