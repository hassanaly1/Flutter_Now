import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:now/controllers/ride_share_controller.dart';
import 'package:now/helper/utils/colors.dart';
import 'package:now/helper/widgets/custom_button_widget.dart';
import 'package:now/helper/widgets/custom_text_widget.dart';
import 'package:now/view/home/features/food/screens/payment_screen.dart';

class RidesScreen extends StatefulWidget {
  const RidesScreen({super.key});

  @override
  State<RidesScreen> createState() => _RidesScreenState();
}

class _RidesScreenState extends State<RidesScreen> {
  static const LatLng _karachi = LatLng(24.8607, 67.0011);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        const GoogleMap(
          initialCameraPosition: CameraPosition(target: _karachi, zoom: 13),
        ),
        SizedBox(
          height: Get.height * 0.02,
        ),
        const BottomNavigationPanel(),
      ],
    ));
  }
}

class BottomNavigationPanel extends StatefulWidget {
  const BottomNavigationPanel({super.key});

  @override
  State<BottomNavigationPanel> createState() => _BottomNavigationPanelState();
}

class _BottomNavigationPanelState extends State<BottomNavigationPanel> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> locations = [
      {'title': 'InstaMini', 'details': '5-8 mins', 'price': "\$146.2"},
      {'title': 'InstaQuick', 'details': '46 mins', 'price': "\$120.2"},
      {'title': 'InstaMega', 'details': '8-10 mins', 'price': "\$166.2"},
      // Add more locations as needed
    ];
    String carUrl = "assets/images/car.png";

    final controller = Get.put(RideshareController());

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Container(
          color: Colors.black.withOpacity(0.6),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(color: Colors.white),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(CupertinoIcons.location,
                              color: AppColors.primaryColor),
                          const SizedBox(width: 14.0),
                          const Expanded(
                            child: Text(
                              'Your Location',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      const Divider(
                        color: Colors.grey, // Customize divider color as needed
                        height: 1.0,
                        thickness: 1.0,
                      ),
                      const SizedBox(height: 8.0),
                      const Row(
                        children: [
                          Icon(
                            Icons.place,
                            color: Colors.red, // Customize icon color as needed
                          ),
                          SizedBox(width: 14.0),
                          Expanded(
                            child: Text(
                              '8677, ApplePark California USA',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
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
                TweenAnimationBuilder<double>(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  tween: Tween(begin: 0.0, end: 1.0),
                  builder: (context, value, child) {
                    return Transform.translate(
                      offset: Offset(0.0, 200 * (1 - value)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20 * value),
                        ),
                        child: Container(
                          height: 200 + (200 * value),
                          width: double.infinity,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextWidget(
                                  text:
                                      'Choose a ride or swipe for more options',
                                  fontSize: 15,
                                  textColor: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                                SizedBox(
                                  height: Get.height * 0.02,
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: locations.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Column(
                                        children: [
                                          Obx(() {
                                            return GestureDetector(
                                              onTap: () {
                                                controller
                                                    .toggleTileColor(index);
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: AppColors
                                                            .primaryColor),
                                                    color: controller
                                                                .pressedIndex ==
                                                            index
                                                        ? AppColors
                                                            .containerColor
                                                        : null, // Change background color when selected

                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    children: [
                                                      Image.asset(carUrl,
                                                          height: Get.height *
                                                              0.08),
                                                      const SizedBox(
                                                          width:
                                                              13), // Adjust spacing as needed
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                                locations[index]
                                                                    ['title']!),
                                                            Row(
                                                              children: [
                                                                Text(locations[
                                                                        index][
                                                                    'details']!),
                                                                SizedBox(
                                                                    width: Get
                                                                            .height *
                                                                        0.014),
                                                                const Icon(
                                                                    Icons
                                                                        .person,
                                                                    size: 15),
                                                                SizedBox(
                                                                    width: Get
                                                                            .height *
                                                                        0.007),
                                                                const Text("3"),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      CustomTextWidget(
                                                        text: locations[index]
                                                            ['price']!,
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      const SizedBox(
                                                          width:
                                                              10), // Adjust spacing as needed
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                          SizedBox(
                                            height: Get.height * 0.02,
                                          )
                                        ],
                                      );
                                    },
                                  ),
                                ),
                                CustomButton(
                                  buttonText: 'Select Ride',
                                  onTap: () {
                                    Get.to(PaymentScreen());
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
