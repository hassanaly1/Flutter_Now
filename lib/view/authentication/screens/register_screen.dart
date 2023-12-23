import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:now/helper/utils/colors.dart';
import 'package:now/helper/widgets/custom_appbar_widget.dart';
import 'package:now/helper/widgets/custom_button_widget.dart';
import 'package:now/helper/widgets/custom_text_widget.dart';
import 'package:now/view/authentication/screens/otp_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarWidget(title: 'Register'),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SizedBox(height: 20.0),
            const CustomRegisterWidget(text: 'FULL NAME', icon: Icons.person),
            const CustomRegisterWidget(
                text: 'EMAIL ADDRESS', icon: Icons.email_outlined),
            const CustomRegisterWidget(text: 'PHONE NUMBER', icon: Icons.phone),
            const SizedBox(height: 10.0),
            CustomTextWidget(
              text: 'We will send verification code on above given number',
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              textColor: Colors.grey,
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
            const Spacer(),
            CustomButton(
              width: double.infinity,
              buttonText: 'Continue',
              onTap: () =>
                  Get.to(const OTPScreen(), transition: Transition.rightToLeft),
            )
          ],
        ),
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
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
      ),
      subtitle: SizedBox(height: 40, child: TextFormField()),
    );
  }
}
