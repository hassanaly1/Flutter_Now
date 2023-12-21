import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:now/helper/classes/custom_appbar_widget.dart';
import 'package:now/helper/widgets/custom_button_widget.dart';
import 'package:now/helper/widgets/custom_text_widget.dart';
import 'package:now/utils/colors.dart';
import 'package:now/view/authentication/screens/otp_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarWidget(title: 'Register'),
      body: Column(
        children: [
          CustomRegisterWidget(text: 'FULL NAME', icon: Icons.person),
          CustomRegisterWidget(
              text: 'EMAIL ADDRESS', icon: Icons.email_outlined),
          CustomRegisterWidget(text: 'PHONE NUMBER', icon: Icons.phone),
          SizedBox(height: 10.0),
          CustomTextWidget(
            text: 'We will send verification code on above given number',
            fontSize: 8.0,
            fontWeight: FontWeight.w700,
            textColor: Colors.grey,
            textAlign: TextAlign.end,
          ),
          Spacer(),
          CustomButton(
            width: double.infinity,
            buttonText: 'Continue',
            onTap: () =>
                Get.to(OTPScreen(), transition: Transition.rightToLeft),
          )
        ],
      ),
    );
  }
}

class CustomRegisterWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  const CustomRegisterWidget({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      titleAlignment: ListTileTitleAlignment.top,
      leading: Icon(
        icon,
        size: 30,
        color: AppColors.primaryColor,
      ),
      title: CustomTextWidget(
        text: text,
        fontSize: 10.0,
        fontWeight: FontWeight.w700,
      ),
      subtitle: SizedBox(height: 40, child: TextFormField()),
    );
  }
}
