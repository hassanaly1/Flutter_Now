import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:now/helper/widgets/custom_button_widget.dart';
import 'package:now/helper/widgets/custom_text_widget.dart';
import 'package:now/view/home/features/uber/screens/rides_screen.dart';
import 'package:now/view/home/features/uber/screens/uber_main_screen.dart';

class SelectONMap extends StatefulWidget {
  final String title;
  final bool pickEntered;
  final IconData icon;
  final Color color;
  const SelectONMap(
      {super.key,
      required this.title,
      required this.pickEntered,
      required this.icon,
      required this.color});
  static const LatLng _karachi = LatLng(24.8607, 67.0011);

  @override
  State<SelectONMap> createState() => _SelectONMapState();
}

class _SelectONMapState extends State<SelectONMap> {
  @override
  Widget build(BuildContext context) {
    String locationUrl = "assets/images/location.png";

    return Scaffold(
        body: Stack(
      children: [
        const GoogleMap(
          initialCameraPosition:
              CameraPosition(target: SelectONMap._karachi, zoom: 13),
        ),
        Positioned(
            top: 190,
            left: 170,
            child: Image.asset(
              locationUrl,
              height: 50,
            )),
        Positioned(
          bottom: 260,
          left: 10,
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: const Center(
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
              decoration: const BoxDecoration(color: Colors.white),
              height: Get.height * 0.330,
              width: Get.width,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                        text: widget.title,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    SizedBox(
                      height: Get.height * 0.023,
                    ),
                    ListTile(
                      title: CustomTextWidget(
                        text: "City Park Museum",
                        fontSize: 17,
                      ),
                      leading: IconButton(
                        icon: Icon(widget.icon),
                        onPressed: () {},
                        color: widget.color,
                      ),
                      subtitle: CustomTextWidget(
                        text: "8677, ApplePark California USA",
                        fontSize: 12,
                        textColor: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.023,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomButton(
                        buttonText: 'Next',
                        onTap: () {
                          if (widget.pickEntered == true) {
                            Get.to(UberMainScreen());
                          } else {
                            Get.to(RidesScreen());
                          }
                        },
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ],
    ));
  }
}
