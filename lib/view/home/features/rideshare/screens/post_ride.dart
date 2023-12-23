import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:now/controllers/carpool_controller.dart';
import 'package:now/helper/utils/colors.dart';
import 'package:now/helper/widgets/custom_appbar_widget.dart';
import 'package:now/helper/widgets/custom_button_widget.dart';
import 'package:now/helper/widgets/custom_text_widget.dart';
import 'package:now/helper/widgets/custom_texxtfield.dart';
import 'package:now/view/home/features/rideshare/screens/location_select_map.dart';
import 'package:now/view/home/features/rideshare/screens/rideshare_main.dart';

class PostRide extends StatefulWidget {
  const PostRide({super.key});

  @override
  State<PostRide> createState() => _PostRideState();
}

class _PostRideState extends State<PostRide> {
  final controller = Get.put(CarpoolController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarWidget(
        title: 'Post Ride',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 7),
                    child: CustomTextWidget(
                      text: "From",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  CustomTextField(
                    hintext: 'Search on Map',
                    icon: Icons.gps_fixed_sharp,
                    iconOnTap: () {
                      Get.to(const LocationSelect());
                    },
                    enableText: true,
                    onTap: () {},
                  )
                ],
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 7),
                    child: CustomTextWidget(
                      text: "To",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  CustomTextField(
                    hintext: 'Search on Map',
                    icon: Icons.gps_fixed_sharp,
                    iconOnTap: () {
                      Get.to(const LocationSelect());
                    },
                    enableText: true,
                    onTap: () {
                      Get.to(const LocationSelect());
                    },
                  )
                ],
              ),
              SizedBox(
                height: Get.height * 0.024,
              ),
              Row(
                children: [
                  Expanded(
                      child: CustomTextField(
                    hintext: controller.time.value != null
                        ? '${controller.time.value.hour.toString()}:${controller.time.value.minute.toString().padLeft(2, '0')}'
                        : "Time",
                    icon: CupertinoIcons.time_solid,
                    enableText: false,
                    onTap: () {
                      controller.selectTime(context);
                    },
                  )),
                  SizedBox(
                    width: Get.width * 0.02,
                  ),
                  Expanded(
                      child: CustomTextField(
                    hintext: controller.date.value != null
                        ? '${controller.date.value.year.toString()}-${controller.date.value.month.toString().padLeft(2, '0')}-${controller.date.value.day.toString().toString().padLeft(2, '0')}'
                        : "Date",
                    icon: CupertinoIcons.calendar,
                    enableText: false,
                    onTap: () {
                      controller.selectFromDate(context);
                    },
                  ))
                ],
              ),
              SizedBox(
                height: Get.height * 0.025,
              ),
              Row(
                children: [
                  Obx(() {
                    return Expanded(
                        child: CustomButtonWithIcon(
                      buttonColor: controller.pressedIndex == 1
                          ? AppColors.containerColor
                          : null,
                      buttonText: 'Car',
                      onTap: () {
                        controller.toggleTileColor(1);
                      },
                      imageUrl: "assets/images/hatchback.png",
                    ));
                  }),
                  SizedBox(
                    width: Get.width * 0.025,
                  ),
                  Obx(() {
                    return Expanded(
                        child: CustomButtonWithIcon(
                      buttonColor: controller.pressedIndex == 2
                          ? AppColors.containerColor
                          : null,
                      buttonText: 'Bike',
                      onTap: () {
                        controller.toggleTileColor(2);
                      },
                      imageUrl: "assets/images/motorbike.png",
                    ));
                  })
                ],
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextWidget(
                    text: "Select No of Seats",
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.counterAddition();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Icon(CupertinoIcons.add),
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.027,
                      ),
                      Obx(() {
                        return CustomTextWidget(
                          text: controller.counterValue.value.toString(),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        );
                      }),
                      SizedBox(
                        width: Get.width * 0.027,
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.counterSubtraction();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Icon(CupertinoIcons.minus),
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextWidget(
                    text: "Set Amount",
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                  SizedBox(
                      width: Get.width * 0.45,
                      child: const CustomTextField(
                        hintext: "",
                        enableText: true,
                        icon: CupertinoIcons.money_dollar_circle,
                      ))
                ],
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              const CustomTextField(
                hintext: "Add specific information",
                enableText: true,
                icon: Icons.comment,
                mxLines: 4,
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              CustomButton(
                buttonText: 'Publish',
                onTap: () {
                  _showLottiePopup(context);
                },
              ),
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
                width: 100,
                height: 100,
                child: Lottie.asset(
                  'assets/images/lottie2.json', // Replace with your Lottie animation file path
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: Get.height * 0.002,
              ),
              CustomTextWidget(
                text: " Request Published",
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
