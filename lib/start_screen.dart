import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:now/view/authentication/screens/register_screen.dart';

import 'helper/widgets/custom_button_widget.dart';
import 'helper/widgets/custom_text_widget.dart';

class StartScreen extends StatefulWidget {
  CountryCode? countryCode;
  StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final countryPicker = FlCountryCodePicker(
    title: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Center(
        child: CustomTextWidget(
            text: 'Select Country',
            fontSize: 24.0,
            fontWeight: FontWeight.w700,
            textAlign: TextAlign.center),
      ),
    ),
    countryTextStyle: GoogleFonts.poppins(fontSize: 14.0),
    dialCodeTextStyle:
        GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.w400),
    localize: true,
    showDialCode: true,
    showSearchBar: true,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.countryCode = const CountryCode(
      name: 'USA',
      code: '+71',
      dialCode: '+71',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(top: context.height * 0.2),
                child: Container(
                  height: 300,
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/splash.png',
                    fit: BoxFit.contain,
                    width: 300,
                    height: 150,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 80,
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          widget.countryCode =
                              await countryPicker.showPicker(context: context);
                          if (widget.countryCode != null) {
                            debugPrint(widget.countryCode!.dialCode);
                          }
                          setState(() {});
                        },
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 13, horizontal: 10),
                            height: 50,
                            width: 70,
                            color: Colors.grey.shade200,
                            child: Center(
                              child: CustomTextWidget(
                                text: widget.countryCode?.dialCode ?? "+1",
                                fontSize: 18,
                              ),
                            )),
                      ),
                      SizedBox(
                        width: context.width * 0.4,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter Phone Number',
                            hintStyle: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: Colors.black54,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      CustomButton(
                        width: context.width * 0.25,
                        buttonText: 'Continue',
                        onTap: () {
                          Get.to(const RegisterScreen());
                        },
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              CustomTextWidget(
                text: 'OR',
                textAlign: TextAlign.center,
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
                textColor: Colors.grey,
              ),
              const SizedBox(height: 20.0),
              CustomButtonWithIcon(
                isSVGImage: true,
                imageUrl: 'assets/icons/facebook.svg',
                width: double.infinity,
                buttonText: 'Continue with Facebook',
                onTap: () {},
                buttonColor: Colors.blueAccent,
                borderColor: Colors.blueAccent,
              ),
              const SizedBox(height: 20.0),
              CustomButtonWithIcon(
                isSVGImage: true,
                imageUrl: 'assets/icons/google.svg',
                width: double.infinity,
                buttonText: 'Continue with Google',
                buttonColor: Colors.transparent,
                borderColor: Colors.grey,
                textColor: Colors.blue,
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
