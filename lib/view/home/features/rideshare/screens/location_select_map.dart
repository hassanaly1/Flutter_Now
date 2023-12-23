import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:now/helper/widgets/custom_text_widget.dart';

class LocationSelect extends StatefulWidget {
  const LocationSelect({super.key});

  @override
  State<LocationSelect> createState() => _LocationSelectState();
}

class _LocationSelectState extends State<LocationSelect> {
  static const LatLng _karachi = LatLng(24.8607, 67.0011);
  final List<Map<String, String>> locations = [
    {'title': 'Home', 'address': '123 Main Street'},
    {'title': 'Work', 'address': '456 Business Avenue'},
    {'title': 'Gym', 'address': '789 Fitness Road'},
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          const GoogleMap(
            initialCameraPosition: CameraPosition(target: _karachi, zoom: 13),
          ),
          ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
              ),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[350],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextWidget(
                        text: "1938, Hill Park New York City",
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        width: Get.width * 0.02,
                      ),
                      GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(CupertinoIcons.checkmark))
                    ],
                  ),
                ),
              ))
        ],
      )),
    );
  }
}
