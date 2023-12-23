import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:now/controllers/ride_share_controller.dart';
import 'package:now/helper/utils/colors.dart';
import 'package:now/helper/widgets/custom_button_widget.dart';
import 'package:now/helper/widgets/custom_text_widget.dart';
import 'package:now/helper/widgets/searchbar.dart';
import 'package:now/view/home/features/uber/screens/select_on_map.dart';

class UberMainScreen extends StatefulWidget {
  const UberMainScreen({super.key});

  @override
  State<UberMainScreen> createState() => _UberMainScreenState();
}

class _UberMainScreenState extends State<UberMainScreen> {
  static const LatLng _karachi = LatLng(24.8607, 67.0011);

  final controller = Get.put(RideshareController());
  bool firstRadioSelected = false;
  bool secondRadioSelected = false;
  final List<Map<String, String>> locations = [
    {'title': 'Home', 'address': '123 Main Street'},
    {'title': 'Work', 'address': '456 Business Avenue'},
    {'title': 'Gym', 'address': '789 Fitness Road'},
    // Add more locations as needed
  ];
  String carUrl = "assets/images/car.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        const GoogleMap(
          initialCameraPosition: CameraPosition(target: _karachi, zoom: 13),
        ),
        Positioned(
          bottom: 280,
          left: 10,
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 13),
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
              child: const Center(
                child: Icon(Icons.arrow_back, color: Colors.black),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
              decoration: const BoxDecoration(color: Colors.white),
              height: Get.height * 0.360,
              width: Get.width,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextWidget(
                              text: 'Where to go?',
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          Image.asset(carUrl, height: Get.height * 0.08)
                        ]),
                    SizedBox(height: Get.height * 0.02),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Obx(
                          () => Row(
                            children: <Widget>[
                              Expanded(
                                child: Radio(
                                    value: 0,
                                    groupValue: controller.selectedRadio.value,
                                    onChanged: (val) {
                                      controller.setSelectedRadio(val!);
                                    },
                                    activeColor: AppColors.primaryColor),
                              ),
                              Expanded(
                                  flex: 9,
                                  child: CustomSearchBar(
                                    hintext: "PickUp Location",
                                    search: false,
                                    onTap: () {
                                      controller.setSelectedRadio(0);
                                      showModalBottomSheet<void>(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.white,
                                        context: context,
                                        builder: (BuildContext context) {
                                          return SizedBox(
                                            height: 600,
                                            child: Container(
                                              color:
                                                  Colors.black.withOpacity(0.6),
                                              child: Center(
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      TweenAnimationBuilder<
                                                          double>(
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    500),
                                                        curve: Curves.easeInOut,
                                                        tween: Tween(
                                                            begin: 0.0,
                                                            end: 1.0),
                                                        builder: (context,
                                                            value, child) {
                                                          return Transform
                                                              .translate(
                                                            offset: Offset(
                                                                0.0,
                                                                200 *
                                                                    (1 -
                                                                        value)),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius.vertical(
                                                                      top: Radius
                                                                          .circular(20 *
                                                                              value)),
                                                              child: Container(
                                                                height: 400 +
                                                                    (400 *
                                                                        value),
                                                                width: double
                                                                    .infinity,
                                                                color: Colors
                                                                    .white,
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          15.0),
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      CustomSearchBar(
                                                                        hintext:
                                                                            "Pickup",
                                                                        onTap:
                                                                            () {},
                                                                        icon: CupertinoIcons
                                                                            .location,
                                                                        color: AppColors
                                                                            .primaryColor,
                                                                        search:
                                                                            true,
                                                                      ),
                                                                      SizedBox(
                                                                        height: Get.height *
                                                                            0.023,
                                                                      ),
                                                                      CustomButton(
                                                                        buttonText:
                                                                            'Select Map',
                                                                        onTap:
                                                                            () {
                                                                          Get.to(
                                                                              const SelectONMap(
                                                                            pickEntered:
                                                                                true,
                                                                            title:
                                                                                'Pickup',
                                                                            icon:
                                                                                CupertinoIcons.location,
                                                                            color:
                                                                                AppColors.primaryColor,
                                                                          ));
                                                                        },
                                                                      ),
                                                                      SizedBox(
                                                                        height: Get.height *
                                                                            0.02,
                                                                      ),
                                                                      CustomTextWidget(
                                                                          text:
                                                                              'Recent Searches',
                                                                          fontSize:
                                                                              20,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                      SizedBox(
                                                                        height: Get.height *
                                                                            0.02,
                                                                      ),
                                                                      ListView
                                                                          .builder(
                                                                        reverse:
                                                                            true,
                                                                        shrinkWrap:
                                                                            true,
                                                                        itemCount:
                                                                            locations.length,
                                                                        itemBuilder:
                                                                            (BuildContext context,
                                                                                int index) {
                                                                          return ListTile(
                                                                            leading:
                                                                                const Icon(Icons.location_on),
                                                                            title:
                                                                                Text(locations[index]['title']!),
                                                                            subtitle:
                                                                                Text(locations[index]['address']!),
                                                                            onTap:
                                                                                () {
                                                                              // Implement onTap functionality here
                                                                              print('Tapped: ${locations[index]['title']}');
                                                                            },
                                                                          );
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
                                        },
                                      );

                                      // Get.to(BottomNavigationPanel2());
                                    },
                                    icon: CupertinoIcons.location_north_fill,
                                    color: AppColors.primaryColor,
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        Obx(
                          () => Row(
                            children: <Widget>[
                              Expanded(
                                child: Radio(
                                  value: 2,
                                  groupValue: controller.selectedRadio.value,
                                  onChanged: (val) {
                                    controller.setSelectedRadio(val!);
                                  },
                                  activeColor: AppColors.primaryColor,
                                ),
                              ),
                              Expanded(
                                  flex: 9,
                                  child: CustomSearchBar(
                                    hintext: "Destination",
                                    search: false,
                                    onTap: () {
                                      controller.setSelectedRadio(2);
                                      showModalBottomSheet<void>(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.white,
                                        context: context,
                                        builder: (BuildContext context) {
                                          return SizedBox(
                                            height: 600,
                                            child: Container(
                                              color:
                                                  Colors.black.withOpacity(0.6),
                                              child: Center(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    TweenAnimationBuilder<
                                                        double>(
                                                      duration: const Duration(
                                                          milliseconds: 500),
                                                      curve: Curves.easeInOut,
                                                      tween: Tween(
                                                          begin: 0.0, end: 1.0),
                                                      builder: (context, value,
                                                          child) {
                                                        return Transform
                                                            .translate(
                                                          offset: Offset(
                                                              0.0,
                                                              200 *
                                                                  (1 - value)),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .vertical(
                                                              top: Radius
                                                                  .circular(20 *
                                                                      value),
                                                            ),
                                                            child: Container(
                                                              height: 400 +
                                                                  (200 * value),
                                                              width: double
                                                                  .infinity,
                                                              color:
                                                                  Colors.white,
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        15.0),
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    CustomSearchBar(
                                                                        hintext:
                                                                            "Destination",
                                                                        onTap:
                                                                            () {},
                                                                        icon: CupertinoIcons
                                                                            .location_solid,
                                                                        color: AppColors
                                                                            .location),
                                                                    SizedBox(
                                                                      height: Get
                                                                              .height *
                                                                          0.023,
                                                                    ),
                                                                    CustomButton(
                                                                      buttonText:
                                                                          'Select Map',
                                                                      onTap:
                                                                          () {
                                                                        Get.to(
                                                                            const SelectONMap(
                                                                          pickEntered:
                                                                              false,
                                                                          title:
                                                                              'Set Destination',
                                                                          icon:
                                                                              CupertinoIcons.location_solid,
                                                                          color:
                                                                              AppColors.location,
                                                                        ));
                                                                      },
                                                                    ),
                                                                    SizedBox(
                                                                        height: Get.height *
                                                                            0.02),
                                                                    SizedBox(
                                                                      height: Get
                                                                              .height *
                                                                          0.02,
                                                                    ),
                                                                    CustomTextWidget(
                                                                        text:
                                                                            'Recent Searches',
                                                                        fontSize:
                                                                            20,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                    SizedBox(
                                                                      height: Get
                                                                              .height *
                                                                          0.02,
                                                                    ),
                                                                    Expanded(
                                                                      child: ListView
                                                                          .builder(
                                                                        shrinkWrap:
                                                                            true,
                                                                        itemCount:
                                                                            locations.length,
                                                                        itemBuilder:
                                                                            (BuildContext context,
                                                                                int index) {
                                                                          return ListTile(
                                                                            leading:
                                                                                const Icon(Icons.location_on),
                                                                            title:
                                                                                Text(locations[index]['title']!),
                                                                            subtitle:
                                                                                Text(locations[index]['address']!),
                                                                            onTap:
                                                                                () {
                                                                              // Implement onTap functionality here
                                                                              print('Tapped: ${locations[index]['title']}');
                                                                            },
                                                                          );
                                                                        },
                                                                      ),
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
                                          );
                                        },
                                      );

                                      // Get.to(BottomNavigationPanel());
                                    },
                                    icon: CupertinoIcons.location_solid,
                                    color: AppColors.location,
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )),
        ),
      ],
    ));
  }
}
