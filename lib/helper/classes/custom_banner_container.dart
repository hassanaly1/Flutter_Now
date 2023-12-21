import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBannerContainer extends StatelessWidget {
  const CustomBannerContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Container(
        height: Get.height * 0.2,
        width: Get.width * 0.7,
        decoration: BoxDecoration(
            color: Colors.redAccent, borderRadius: BorderRadius.circular(16.0)),
      ),
    );
  }
}
