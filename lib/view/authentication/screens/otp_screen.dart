import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:now/bottom_bar.dart';
import 'package:now/helper/utils/toast_message.dart';
import 'package:now/helper/widgets/custom_appbar_widget.dart';
import 'package:now/helper/widgets/custom_button_widget.dart';
import 'package:now/helper/widgets/custom_text_widget.dart';
import 'package:pinput/pinput.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController _pinController = TextEditingController();
  Color borderColor = const Color.fromRGBO(114, 178, 238, 1);
  Color errorColor = const Color.fromRGBO(255, 234, 238, 1);
  Color fillColor = const Color.fromRGBO(222, 231, 240, .57);
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 60,
    textStyle: GoogleFonts.poppins(
      fontSize: 22,
      color: const Color.fromRGBO(30, 60, 87, 1),
    ),
    decoration: BoxDecoration(
      color: const Color.fromRGBO(222, 231, 240, .57),
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.transparent),
    ),
  );

  bool _timerInProgress = true;
  int _start = 60;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer timer) {
      if (_start == 0) {
        setState(() {
          _timerInProgress = false;
        });
        timer.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarWidget(title: 'Verification'),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: CustomTextWidget(
                  text: 'Enter verification code we have sent on given number',
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  maxLines: 3,
                ),
              ),
              const SizedBox(height: 20.0),
              Pinput(
                controller: _pinController,
                validator: (s) {
                  return s == '2222' ? null : 'Pin is incorrect';
                },
                errorTextStyle: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.redAccent,
                ),
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: defaultPinTheme.copyWith(
                  height: 68,
                  width: 64,
                  decoration: defaultPinTheme.decoration!.copyWith(
                    border: Border.all(color: borderColor),
                  ),
                ),
                errorPinTheme: defaultPinTheme.copyWith(
                  decoration: BoxDecoration(
                    color: errorColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onCompleted: (pin) {
                  if (pin == '2222') {
                    Utils().toastMessage('Login Successfully');
                    Get.offAll(const BottomBar(),
                        transition: Transition.rightToLeft);
                  }
                  setState(() {
                    _pinController.clear();
                    _timerInProgress = false;
                  });
                },
              ),
              const Spacer(),
              _timerInProgress
                  ? CustomTextWidget(text: 'Resend OTP in $_start seconds')
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextWidget(
                            text: 'Didn\'t receive OTP?',
                            textColor: Colors.black,
                            fontSize: 15,
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _timerInProgress = true;
                                _start = 60;
                              });
                              _pinController.clear();
                              startTimer();
                            },
                            child: CustomTextWidget(
                              text: 'Resend OTP',
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
              //

              const SizedBox(height: 20.0),
              CustomButton(
                buttonText: 'Submit',
                onTap: () {
                  // Validate OTP and perform actions
                  String enteredOTP = _pinController.text;
                  if (enteredOTP.length == 4) {
                    // Perform validation and actions here
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
