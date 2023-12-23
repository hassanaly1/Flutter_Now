import 'package:flutter/material.dart';
import 'package:now/helper/widgets/custom_text_widget.dart';

class CustomFeatureContainer extends StatelessWidget {
  final String imageUrl;
  final String text;
  final VoidCallback onTap;
  const CustomFeatureContainer({
    super.key,
    required this.imageUrl,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: Column(
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(16.0),
                  image: DecorationImage(
                      image: AssetImage(imageUrl), fit: BoxFit.cover)),
            ),
            CustomTextWidget(
              text: text,
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              textColor: Colors.black54,
            )
          ],
        ),
      ),
    );
  }
}
