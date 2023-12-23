import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:now/helper/widgets/custom_banner_container.dart';
import 'package:now/helper/widgets/custom_feature_container.dart';
import 'package:now/helper/widgets/custom_text_widget.dart';
import 'package:now/helper/widgets/searchbar.dart';
import 'package:now/view/home/features/documents/screens/documents_selection_screen.dart';
import 'package:now/view/home/features/food/screens/food_categories_screen.dart';
import 'package:now/view/home/features/package/screens/package_selection_screen.dart';
import 'package:now/view/home/features/rideshare/screens/rideshare_main.dart';
import 'package:now/view/home/features/uber/screens/uber_main_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 20,
                    backgroundImage: AssetImage('assets/images/person.jpg'),
                  ),
                  SizedBox(width: 15.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                          text: 'Current Location',
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                        CustomTextWidget(
                          text:
                              '36 East 8th Street, New York, NY 10003, United States',
                          fontSize: 10.0,
                          maxLines: 5,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 15.0),
                  IconButton(
                    onPressed: () {},
                    icon: const FaIcon(FontAwesomeIcons.cartShopping),
                  )
                ],
              ),
              const SizedBox(height: 20.0),
              const CustomSearchBar(hintext: 'Search'),
              const SizedBox(height: 20.0),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CustomBannerContainer(imageUrl: 'assets/images/1.PNG'),
                    CustomBannerContainer(imageUrl: 'assets/images/2.PNG'),
                    CustomBannerContainer(imageUrl: 'assets/images/3.PNG'),
                    CustomBannerContainer(imageUrl: 'assets/images/4.PNG'),
                  ],
                ),
              ),
              const SizedBox(height: 15.0),
              CustomTextWidget(
                text: 'What are you looking for today?',
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 15.0),
              const Divider(),
              CustomTextWidget(
                text: 'Categories',
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(height: 15.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    OpenContainer(
                      openColor: Colors.transparent,
                      closedColor: Colors.transparent,
                      closedBuilder: (context, action) =>
                          CustomFeatureContainer(
                              text: 'Ride',
                              imageUrl: 'assets/images/uber.jpg',
                              onTap: action),
                      openBuilder: (context, action) => UberMainScreen(),
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
                                text: 'Ride Share',
                                imageUrl: 'assets/images/rideshare.jpg',
                                onTap: action),
                        openBuilder: (context, action) =>
                            const RideShareScreen(),
                        openElevation: 0,
                        closedElevation: 0,
                        closedShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0))),
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
                            const PackageSelectionScreen(),
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
                            const DocumentSelectionScreen(),
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
                    CustomBannerContainer(imageUrl: 'assets/images/5.jpg'),
                    CustomBannerContainer(imageUrl: 'assets/images/6.jpg'),
                    CustomBannerContainer(imageUrl: 'assets/images/7.jpg'),
                    CustomBannerContainer(imageUrl: 'assets/images/8.jpg'),
                    CustomBannerContainer(imageUrl: 'assets/images/9.jpg'),
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
