// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print

import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:goorani/screen/home.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../models/Controller.dart';
import '../models/colorstyle.dart';

class SendCode extends StatefulWidget {
  const SendCode({
    Key? key,
  }) : super(key: key);
  // final String phoneNumber;
  // PinCodeVerificationScreen(this.phoneNumber);
  //  @override
  // _PinCodeVerificationScreenState createState() =>
  //     _PinCodeVerificationScreenState();

  @override
  State<SendCode> createState() => _SendCodeState();
}

class _SendCodeState extends State<SendCode> {
  var onTapRecognizer;

  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  late StreamController<ErrorAnimationType> errorController;

  bool hasError = false;
  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };

    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }

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
                'Verify phone',
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
                'number',
                textAlign: TextAlign.start,
                style: TextStyle(
                    // fontFamily: 'DancingScript',
                    fontSize: 32,
                    color: Colors.white),
              ),
            ),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Container(
                  padding: const EdgeInsets.all(32),
                  margin: const EdgeInsets.only(top: 64),
                  child: PinCodeTextField(
                    textStyle: TextStyle(color: ColorStyle().colorYellow),
                    appContext: context,
                    length: 4,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.underline,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      // activeFillColor: Colors.white,
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    // backgroundColor: Colors.blue.shade50,
                    // enableActiveFill: true,
                    errorAnimationController: errorController,
                    controller: textEditingController,
                    onCompleted: (v) {
                      print("Completed");
                    },
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        currentText = value;
                      });
                    },
                    beforeTextPaste: (text) {
                      print("Allowing to paste $text");
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    },
                  )),
            ),
            _Continue(),
            Center(
              child: TextButton(
                  style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(32.0),
                      primary: ColorStyle().colorYellow),
                  child: const Text(
                    'Resend Code',
                    style: TextStyle(fontSize: 13),
                  ),
                  onPressed: () {
                    // _controller.reset();
                    // _controller.start();
                  }),
            ),
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
              // if(PinCodeTextField == null){

              // }else{

              // }
              Get.to(const Home());
            },
            style: ElevatedButton.styleFrom(
              primary: ColorStyle().colorYellow,
              elevation: 32,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              minimumSize: const Size(double.infinity, 45), //////// HERE
            ),
            child: Text(
              'CONTINUE',
              textAlign: TextAlign.center,
              style: TextStyle(color: ColorStyle().colorDark),
            ),
          ),
        ],
      ),
    ),
  );
}
