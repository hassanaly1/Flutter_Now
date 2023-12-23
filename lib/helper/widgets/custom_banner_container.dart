import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBannerContainer extends StatelessWidget {
  final String imageUrl;
  const CustomBannerContainer({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Container(
        height: Get.height * 0.2,
        width: Get.width * 0.6,
        decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(16.0),
            image: DecorationImage(
                image: AssetImage(imageUrl), fit: BoxFit.cover)),
      ),
    );
  }
}
