import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:now/helper/utils/colors.dart';
import 'package:now/helper/widgets/custom_button_widget.dart';
import 'package:now/helper/widgets/custom_text_widget.dart';
import 'package:now/view/home/features/rideshare/screens/rideshare_main.dart';

class PostRideWidget extends StatelessWidget {
  final String imageURl;
  final String fromLocation;
  final String date;
  final String toLocation;
  final double amount;
  final String time;
  final String type;
  final String seats;
  final double rating;
  final vehicleNo;

  const PostRideWidget(
      {super.key,
      required this.imageURl,
      required this.fromLocation,
      required this.date,
      required this.toLocation,
      required this.amount,
      required this.time,
      required this.type,
      required this.seats,
      required this.rating,
      this.vehicleNo});

  @override
  Widget build(BuildContext context) {
    String carImageUrl = "assets/images/hatchback.png";
    String bikeImageUrl = "assets/images/motorbike.png";
    String seatImageUrl = "assets/images/seat.png";

    return GestureDetector(
      onTap: () {
        showModalBottomSheet<void>(
          isScrollControlled: true,
          backgroundColor: Colors.white,
          context: context,
          builder: (BuildContext context) {
            return SizedBox(
              height: 340,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(
                            imageURl,
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.003,
                        ),
                        CustomTextWidget(
                          text: "Dany Moris",
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: Get.height * 0.003,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow.shade800,
                                size: 18,
                              ),
                              SizedBox(
                                width: Get.width * 0.008,
                              ),
                              CustomTextWidget(
                                text: rating.toString(),
                                fontSize: 14,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Icon(CupertinoIcons.calendar),
                                    SizedBox(
                                      width: Get.width * 0.02,
                                    ),
                                    Text(date)
                                  ],
                                ),
                                const VerticalDivider(
                                  color: Colors.black,
                                  thickness: 1,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Icon(CupertinoIcons.time),
                                    SizedBox(
                                      width: Get.width * 0.02,
                                    ),
                                    Text(time)
                                  ],
                                ),
                                const VerticalDivider(
                                  color: Colors.black,
                                  thickness: 1,
                                ),
                                Row(
                                  children: [
                                    const Icon(FontAwesomeIcons.moneyBill1),
                                    SizedBox(
                                      width: Get.width * 0.02,
                                    ),
                                    Text(amount.toString())
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: Get.width * 0.7,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey[200],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(CupertinoIcons.location,
                                          color: AppColors.primaryColor),
                                      SizedBox(
                                        width: Get.width * 0.02,
                                      ),
                                      CustomTextWidget(
                                        text: fromLocation,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.009,
                                  ),
                                  const Icon(Icons.more_horiz,
                                      color: AppColors.primaryColor),
                                  SizedBox(
                                    width: Get.width * 0.009,
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
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.04,
                        ),
                        CustomButton(
                          buttonText: "Ask",
                          onTap: () {
                            _showLottiePopup(context);
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
      },
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
                    width: Get.width * 0.7,
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
                                const Icon(CupertinoIcons.location,
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
                            type == "car"
                                ? Image.asset(
                                    carImageUrl,
                                    height: 35,
                                  )
                                : Image.asset(
                                    bikeImageUrl,
                                    height: 35,
                                  ),
                            SizedBox(
                              height: Get.height * 0.005,
                            ),
                            CustomTextWidget(
                              text: vehicleNo,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            )
                          ],
                        ),
                        SizedBox(
                          width: Get.width * 0.03,
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
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow.shade800,
                              size: 18,
                            ),
                            SizedBox(
                              width: Get.width * 0.003,
                            ),
                            CustomTextWidget(
                              text: rating.toString(),
                              fontSize: 14,
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
              const Divider(
                color: Colors.grey,
              ),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(CupertinoIcons.calendar),
                        SizedBox(
                          width: Get.width * 0.02,
                        ),
                        Text(date)
                      ],
                    ),
                    const VerticalDivider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(CupertinoIcons.time),
                        SizedBox(
                          width: Get.width * 0.02,
                        ),
                        Text(time)
                      ],
                    ),
                    const VerticalDivider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                    Row(
                      children: [
                        const Icon(FontAwesomeIcons.moneyBill1),
                        SizedBox(
                          width: Get.width * 0.02,
                        ),
                        Text(amount.toString())
                      ],
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

  void _showLottiePopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Get.off(const RideShareScreen());
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
                text: "Request has been sent",
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
