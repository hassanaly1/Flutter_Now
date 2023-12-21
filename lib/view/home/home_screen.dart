import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:now/helper/classes/custom_banner_container.dart';
import 'package:now/helper/classes/custom_feature_container.dart';
import 'package:now/helper/widgets/custom_text_widget.dart';
import 'package:now/helper/widgets/searchbar.dart';
import 'package:now/view/home/features/documents/screens/documents_selection_screen.dart';
import 'package:now/view/home/features/food/screens/food_categories_screen.dart';
import 'package:now/view/home/features/package/screens/package_selection_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                height: Get.height * 0.1,
                color: Colors.transparent,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: context.width * 0.8,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            text: 'Current Location',
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                          ),
                          CustomTextWidget(
                            text:
                                '36 East 8th Street, New York, NY 10003, United States',
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const FaIcon(FontAwesomeIcons.cartShopping),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 5.0),
              const CustomSearchBar(),
              const SizedBox(height: 15.0),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CustomBannerContainer(),
                    CustomBannerContainer(),
                    CustomBannerContainer(),
                  ],
                ),
              ),
              const SizedBox(height: 15.0),
              CustomTextWidget(
                text: 'What are you looking for today?',
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
              ),
              const SizedBox(height: 15.0),
              const Divider(),
              CustomTextWidget(
                text: 'Categories',
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
              ),
              const SizedBox(height: 15.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CustomFeatureContainer(
                      text: 'Ride',
                      imageUrl: 'assets/images/uber.jpg',
                      onTap: () {},
                    ),
                    CustomFeatureContainer(
                      text: 'Ride Share',
                      imageUrl: 'assets/images/rideshare.jpg',
                      onTap: () {},
                    ),
                    OpenContainer(
                      openColor: Colors.transparent,
                      closedColor: Colors.transparent,
                      closedBuilder: (context, action) =>
                          CustomFeatureContainer(
                              text: 'Food',
                              imageUrl: 'assets/images/food.PNG',
                              onTap: action),
                      openBuilder: (context, action) => FoodCategoriesScreen(),
                      openElevation: 0,
                      closedElevation: 0,
                      closedShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0)),
                    ),
                    OpenContainer(
                        openColor: Colors.transparent,
                        closedColor: Colors.transparent,
                        closedBuilder: (context, action) =>
                            CustomFeatureContainer(
                                text: 'Package',
                                imageUrl: 'assets/images/parcel.PNG',
                                onTap: action),
                        openBuilder: (context, action) =>
                            PackageSelectionScreen(),
                        openElevation: 0,
                        closedElevation: 0,
                        closedShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0))),
                    OpenContainer(
                        openColor: Colors.transparent,
                        closedColor: Colors.transparent,
                        closedBuilder: (context, action) =>
                            CustomFeatureContainer(
                                text: 'Documents',
                                imageUrl: 'assets/images/documents.PNG',
                                onTap: action),
                        openBuilder: (context, action) =>
                            DocumentSelectionScreen(),
                        openElevation: 0,
                        closedElevation: 0,
                        closedShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0))),
                  ],
                ),
              ),
              const Divider(),
              const SizedBox(height: 15.0),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CustomBannerContainer(),
                    CustomBannerContainer(),
                    CustomBannerContainer(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
