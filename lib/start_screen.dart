import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'helper/widgets/custom_button_widget.dart';
import 'helper/widgets/custom_text_widget.dart';

class StartScreen extends StatefulWidget {
  CountryCode? countryCode;
  StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final countryPicker = const FlCountryCodePicker(
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
      code: '',
      dialCode: '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.red,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white60,
              child: Column(
                children: [
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
                              widget.countryCode = await countryPicker
                                  .showPicker(context: context);
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
                                    text: widget.countryCode?.dialCode ?? "",
                                    fontSize: 22,
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
                            onTap: () {},
                          )
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  CustomTextWidget(
                    text: 'OR',
                    textAlign: TextAlign.center,
                  ),
                  Spacer(),
                  CustomButtonWithIcon(
                    imageUrl: 'assets/icons/facebook.svg',
                    width: double.infinity,
                    buttonText: 'Continue with Facebook',
                    onTap: () {},
                    buttonColor: Colors.blueAccent,
                    borderColor: Colors.blueAccent,
                  ),
                  CustomButtonWithIcon(
                    imageUrl: 'assets/icons/google.svg',
                    width: double.infinity,
                    buttonText: 'Continue with Google',
                    buttonColor: Colors.transparent,
                    borderColor: Colors.transparent,
                    textColor: Colors.blue,
                    onTap: () {},
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
