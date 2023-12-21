import 'package:flutter/material.dart';
import 'package:now/helper/widgets/custom_text_widget.dart';

class ReUsableProfileTabs extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  const ReUsableProfileTabs(
      {super.key, required this.text, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, size: 15),
          const SizedBox(width: 5),
          CustomTextWidget(
            text: text,
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
            textColor: Colors.black,
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black)
        ],
      ),
    );
  }
}
