import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:now/controllers/ride_share_controller.dart';
import 'package:now/helper/utils/colors.dart';
import 'package:now/helper/widgets/custom_text_widget.dart';

class DriversScreen extends StatefulWidget {
  const DriversScreen({super.key});

  @override
  State<DriversScreen> createState() => _DriversScreenState();
}

class _DriversScreenState extends State<DriversScreen> {
  static const LatLng _karachi = LatLng(24.8607, 67.0011);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Stack(
      children: [
        GoogleMap(
          initialCameraPosition: CameraPosition(target: _karachi, zoom: 13),
        ),
        BottomNavigationPanel()
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
      {'title': 'InstaMega', 'details': '8-10 mins', 'price': "\$166.2"},

      // Add more locations as needed
    ];
    String personUrl = "assets/images/person.jpg";
    String carUrl = "assets/images/car.png";
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
                  child: const Column(
                    children: [
                      Row(
                        children: [
                          Icon(CupertinoIcons.location,
                              color: AppColors.primaryColor),
                          SizedBox(width: 14.0),
                          Expanded(
                            child: Text(
                              'Your Location',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.0),
                      Divider(
                        color: Colors.grey, // Customize divider color as needed
                        height: 1.0,
                        thickness: 1.0,
                      ),
                      SizedBox(height: 8.0),
                      Row(
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
                Column(
                  children: [
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
                              color: AppColors.primaryColor,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 8),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              carUrl,
                                              height: Get.height * 0.05,
                                            ),
                                            SizedBox(
                                              width: Get.width * 0.08,
                                            ),
                                            CustomTextWidget(
                                              text: "Driver arriving in 2 min",
                                              textColor: Colors.white,
                                            )
                                          ],
                                        ),
                                      ),
                                      TweenAnimationBuilder<double>(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.easeInOut,
                                        tween: Tween(begin: 0.0, end: 1.0),
                                        builder: (context, value, child) {
                                          return Transform.translate(
                                            offset:
                                                Offset(0.0, 200 * (1 - value)),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                top:
                                                    Radius.circular(20 * value),
                                              ),
                                              child: Container(
                                                height: 280 + (280 * value),
                                                width: double.infinity,
                                                color: Colors.white,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      13.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        decoration: BoxDecoration(
                                                            color: Colors
                                                                .grey.shade200,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10.0),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      CustomTextWidget(
                                                                          text:
                                                                              "Toyota Calya"),
                                                                      CustomTextWidget(
                                                                        text:
                                                                            "KLV-1234",
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Container(
                                                                    height: 50,
                                                                    width: 50,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                      image:
                                                                          DecorationImage(
                                                                        image: AssetImage(
                                                                            personUrl), // Replace with your image path
                                                                        fit: BoxFit
                                                                            .cover, // Adjust the fit as needed (cover, contain, etc.)
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              CustomTextWidget(
                                                                  text:
                                                                      "_________________________________"),
                                                              SizedBox(
                                                                height:
                                                                    Get.height *
                                                                        0.015,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  CustomTextWidget(
                                                                    text:
                                                                        "Georger Anderson",
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                  SizedBox(
                                                                    width:
                                                                        Get.width *
                                                                            0.07,
                                                                  ),
                                                                  Container(
                                                                    padding: const EdgeInsets
                                                                        .symmetric(
                                                                        horizontal:
                                                                            3,
                                                                        vertical:
                                                                            3),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .green, // Set container color to green
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0), // Add border radius for rounded corners
                                                                    ),
                                                                    child:
                                                                        const Center(
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        children: [
                                                                          Icon(
                                                                            Icons.star,
                                                                            color:
                                                                                Colors.yellow, // Set star color to yellow
                                                                          ),
                                                                          SizedBox(
                                                                              width: 8.0),
                                                                          Text(
                                                                            '4.5', // Replace with your rating value
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 18.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Colors.white, // Set rating text color
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                              width: 8.0),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width:
                                                                        Get.width *
                                                                            0.07,
                                                                  ),
                                                                  Container(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(
                                                                            10.0),
                                                                    decoration: BoxDecoration(
                                                                        color: Colors.white, // Set container color to white
                                                                        borderRadius: BorderRadius.circular(10.0),
                                                                        border: Border.all(color: AppColors.primaryColor) // Add border radius for rounded corners
                                                                        ),
                                                                    child:
                                                                        const Icon(
                                                                      Icons
                                                                          .phone,
                                                                      size:
                                                                          20.0, // Adjust the size of the phone icon
                                                                      color: Colors
                                                                          .green, // Set phone icon color
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),

                                                      const SizedBox(
                                                          height: 8.0),

                                                      CustomTextWidget(
                                                        text: "Trip Details",
                                                        textColor: Colors.grey,
                                                        fontSize: 17,
                                                      ),

                                                      Container(
                                                        decoration: BoxDecoration(
                                                            color: Colors
                                                                .grey.shade200,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                const Icon(
                                                                    CupertinoIcons
                                                                        .location,
                                                                    color: AppColors
                                                                        .primaryColor),
                                                                SizedBox(
                                                                  width:
                                                                      Get.width *
                                                                          0.03,
                                                                ),
                                                                Expanded(
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      CustomTextWidget(
                                                                        text:
                                                                            'Pickup Location',
                                                                        fontSize:
                                                                            12,
                                                                        textColor:
                                                                            Colors.black,
                                                                      ),
                                                                      SizedBox(
                                                                          height:
                                                                              Get.height * 0.006),
                                                                      CustomTextWidget(
                                                                          text:
                                                                              "1141 Central Park, Hemilton")
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                                height: 8.0),
                                                            const Divider(
                                                              color: Colors
                                                                  .grey, // Customize divider color as needed
                                                              height: 1.0,
                                                              thickness: 1.0,
                                                            ),
                                                            const SizedBox(
                                                                height: 8.0),
                                                            Row(
                                                              children: [
                                                                const Icon(
                                                                  Icons.place,
                                                                  color: Colors
                                                                      .red, // Customize icon color as needed
                                                                ),
                                                                const SizedBox(
                                                                    width:
                                                                        14.0),
                                                                Expanded(
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      CustomTextWidget(
                                                                        text:
                                                                            'Drop off Location',
                                                                        fontSize:
                                                                            12,
                                                                        textColor:
                                                                            Colors.black,
                                                                      ),
                                                                      SizedBox(
                                                                          height:
                                                                              Get.height * 0.006),
                                                                      CustomTextWidget(
                                                                          text:
                                                                              "8559 Dr.Jamestown, NY 14701")
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 8.0),

                                                      Container(
                                                        decoration: BoxDecoration(
                                                            color: Colors
                                                                .grey.shade200,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                CustomTextWidget(
                                                                  text:
                                                                      "Ride Cost",
                                                                  fontSize: 13,
                                                                ),
                                                                CustomTextWidget(
                                                                  text:
                                                                      '\$8.00',
                                                                  fontSize: 13,
                                                                  textColor:
                                                                      Colors
                                                                          .black,
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                                height: 8.0),
                                                            const Divider(
                                                              color: Colors
                                                                  .grey, // Customize divider color as needed
                                                              height: 1.0,
                                                              thickness: 1.0,
                                                            ),
                                                            const SizedBox(
                                                                height: 8.0),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                CustomTextWidget(
                                                                  text:
                                                                      "Payment Method",
                                                                  fontSize: 13,
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    const Icon(
                                                                        FontAwesomeIcons
                                                                            .wallet,
                                                                        color: AppColors
                                                                            .primaryColor),
                                                                    SizedBox(
                                                                      width: Get
                                                                              .width *
                                                                          0.02,
                                                                    ),
                                                                    CustomTextWidget(
                                                                      text:
                                                                          'Wallet',
                                                                      fontSize:
                                                                          13,
                                                                      textColor:
                                                                          Colors
                                                                              .black,
                                                                    ),
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 8.0),
                                                      //Order
                                                      Container(
                                                        decoration: BoxDecoration(
                                                            color: Colors
                                                                .grey.shade200,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                CustomTextWidget(
                                                                  text:
                                                                      "Order ID",
                                                                  fontSize: 13,
                                                                ),
                                                                CustomTextWidget(
                                                                  text:
                                                                      'FD3614FJ',
                                                                  fontSize: 13,
                                                                  textColor:
                                                                      Colors
                                                                          .black,
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                                height: 8.0),
                                                            const Divider(
                                                              color: Colors
                                                                  .grey, // Customize divider color as needed
                                                              height: 1.0,
                                                              thickness: 1.0,
                                                            ),
                                                            const SizedBox(
                                                                height: 8.0),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                CustomTextWidget(
                                                                  text:
                                                                      "Order on",
                                                                  fontSize: 13,
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    SizedBox(
                                                                      width: Get
                                                                              .width *
                                                                          0.02,
                                                                    ),
                                                                    CustomTextWidget(
                                                                      text:
                                                                          'Today, 12:56 PM',
                                                                      fontSize:
                                                                          13,
                                                                      textColor:
                                                                          Colors
                                                                              .black,
                                                                    ),
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 10.0),

                                                      Align(
                                                        alignment: Alignment
                                                            .bottomCenter,
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            Get.dialog(
                                                                RatingDialog());
                                                          },
                                                          child: Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: AppColors
                                                                  .containerColor, // Set container background color to light green
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0), // Add border radius for rounded corners
                                                            ),
                                                            child: const Text(
                                                              'Rate Now',
                                                              style: TextStyle(
                                                                fontSize: 17.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: AppColors
                                                                    .primaryColor, // Set text color to black
                                                              ),
                                                            ),
                                                          ),
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
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RatingDialog extends StatelessWidget {
  final RideshareController _ratingController = Get.put(RideshareController());
  String personUrl = "assets/person.jpg";

  RatingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(personUrl),
              radius: 40,
            ),
            SizedBox(height: Get.height * 0.009),
            CustomTextWidget(
              text: 'Rate Driver',
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: Get.height * 0.006),
            CustomTextWidget(
              text: 'How was driver service?',
              fontSize: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    _ratingController.setRating(1.0);
                  },
                  icon: Icon(Icons.star, color: _getStarColor(1)),
                ),
                IconButton(
                  onPressed: () {
                    _ratingController.setRating(2.0);
                  },
                  icon: Icon(Icons.star, color: _getStarColor(2)),
                ),
                IconButton(
                  onPressed: () {
                    _ratingController.setRating(3.0);
                  },
                  icon: Icon(Icons.star, color: _getStarColor(3)),
                ),
                IconButton(
                  onPressed: () {
                    _ratingController.setRating(4.0);
                  },
                  icon: Icon(Icons.star, color: _getStarColor(4)),
                ),
                IconButton(
                  onPressed: () {
                    _ratingController.setRating(5.0);
                  },
                  icon: Icon(Icons.star, color: _getStarColor(5)),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.blue
                        .shade200, // Set container background color to light green
                    borderRadius: BorderRadius.circular(
                        10.0), // Add border radius for rounded corners
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue // Set text color to black
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to determine star color based on the rating value
  Color _getStarColor(int index) {
    return _ratingController.rating.value >= index
        ? Colors.orange
        : Colors.grey;
  }
}
