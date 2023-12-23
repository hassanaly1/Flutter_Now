import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:now/helper/utils/colors.dart';
import 'package:now/helper/widgets/custom_text_widget.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  final Color? buttonColor;
  final Color? textColor;
  final Color? borderColor;
  final double width;
  final double? height;

  const CustomButton({
    super.key,
    required this.buttonText,
    required this.onTap,
    this.width = double.infinity,
    this.buttonColor,
    this.textColor,
    this.borderColor,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: height ?? 40,
          width: width,
          decoration: BoxDecoration(
              color: buttonColor ?? AppColors.primaryColor,
              border: Border.all(color: borderColor ?? AppColors.primaryColor)),
          child: Center(
              child: CustomTextWidget(
            text: buttonText,
            fontSize: 14,
            textColor: textColor ?? Colors.white,
            fontWeight: FontWeight.w600,
          ))),
    );
  }
}

class CustomButtonWithIcon extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  final Color? buttonColor;
  final Color? textColor;
  final Color? borderColor;
  final double width;
  final double? height;
  final String imageUrl;
  final bool? isSVGImage;
  CustomButtonWithIcon(
      {super.key,
      required this.buttonText,
      required this.onTap,
      this.width = double.infinity,
      this.buttonColor,
      this.textColor,
      this.borderColor,
      this.height,
      this.isSVGImage,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: height ?? 50,
          width: width,
          decoration: BoxDecoration(
              color: buttonColor ?? AppColors.primaryColor,
              border: Border.all(color: borderColor ?? AppColors.primaryColor)),
          child: Row(
            children: [
              const Spacer(),
              isSVGImage == true
                  ? SvgPicture.asset(
                      imageUrl,
                      width: 30,
                    )
                  : Image.asset(
                      imageUrl,
                      width: 30,
                    ),
              const SizedBox(width: 15.0),
              CustomTextWidget(
                text: buttonText,
                fontSize: 16,
                textColor: textColor ?? Colors.white,
                fontWeight: FontWeight.w600,
              ),
              const Spacer(),
            ],
          )),
    );
  }
}
