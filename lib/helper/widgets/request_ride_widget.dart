import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:now/helper/utils/colors.dart';
import 'package:now/helper/widgets/custom_text_widget.dart';
import 'package:now/view/home/features/rideshare/screens/rideshare_main.dart';

class RequestRideWidget extends StatelessWidget {
  final String imageURl;
  final String fromLocation;
  final String toLocation;
  final String name;
  final String seats;

  const RequestRideWidget(
      {super.key,
      required this.imageURl,
      required this.fromLocation,
      required this.toLocation,
      required this.seats,
      required this.name});

  @override
  Widget build(BuildContext context) {
    String carImageUrl = "assets/images/hatchback.png";
    String bikeImageUrl = "assets/images/motorbike.png";
    String seatImageUrl = "assets/images/seat.png";

    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 7,
            offset: const Offset(0, 3),
          )
        ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: Get.width * 0.6,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[200],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(CupertinoIcons.location,
                                    color: AppColors.primaryColor),
                                SizedBox(
                                  width: Get.width * 0.02,
                                ),
                                CustomTextWidget(
                                  text: fromLocation,
                                )
                              ],
                            ),
                            const Icon(
                              Icons.more_vert_outlined,
                              color: Colors.red,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  CupertinoIcons.location_solid,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  width: Get.width * 0.02,
                                ),
                                CustomTextWidget(
                                  text: toLocation,
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          width: Get.width * 0.02,
                        ),
                        Column(
                          children: [
                            Image.asset(
                              seatImageUrl,
                              height: 35,
                            ),
                            SizedBox(
                              height: Get.height * 0.005,
                            ),
                            CustomTextWidget(
                              text: seats,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            )

                            // type=="car"? CustomTextWidget(text: "Car",fontSize: 13,fontWeight: FontWeight.bold,):
                            // CustomTextWidget(text: "Bike",fontSize: 13,fontWeight: FontWeight.bold,)
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(
                          imageURl,
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.003,
                      ),
                      CustomTextWidget(
                        text: name,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      )
                    ],
                  ),
                  SizedBox(
                    width: Get.width * 0.002,
                  ),
                ],
              ),
              const Divider(
                color: Colors.grey,
              ),
              IntrinsicHeight(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _showLottiePopupReject(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.red,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              CupertinoIcons.delete,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: Get.width * 0.02,
                            ),
                            CustomTextWidget(
                              text: "Reject",
                              textColor: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.02,
                    ),
                    const VerticalDivider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                    SizedBox(
                      width: Get.width * 0.02,
                    ),
                    GestureDetector(
                      onTap: () {
                        _showLottiePopupAccept(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.green,
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: Get.width * 0.02,
                            ),
                            CustomTextWidget(
                              text: "Accept",
                              textColor: Colors.white,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showLottiePopupAccept(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Get.off(RideShareScreen());
              },
              child: const Text('Close'),
            ),
          ],
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 200,
                height: 200,
                child: Lottie.asset(
                  'assets/images/lottie.json', // Replace with your Lottie animation file path
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: Get.height * 0.002,
              ),
              CustomTextWidget(
                text: "Request Accepted",
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ],
          ),
        );
      },
    );
  }
}

void _showLottiePopupReject(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Get.off(RideShareScreen());
            },
            child: const Text('Close'),
          ),
        ],
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: Lottie.asset(
                'assets/images/reject.json', // Replace with your Lottie animation file path
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: Get.height * 0.002,
            ),
            CustomTextWidget(
              text: "Request Rejected",
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ],
        ),
      );
    },
  );
}
