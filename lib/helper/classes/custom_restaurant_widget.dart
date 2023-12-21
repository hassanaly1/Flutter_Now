import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:now/helper/widgets/custom_text_widget.dart';
import 'package:now/view/home/features/food/models/restaurant_model.dart';

class CustomRestaurantWidget extends StatelessWidget {
  final RestaurantModel? restaurantModel;
  // final String restaurantName;
  // final String restaurantImage;
  // final double restaurantDistance;
  // final double restaurantRatings;
  // final String restaurantLocation;
  // final int travellingDistance;
  final VoidCallback onTap;
  const CustomRestaurantWidget({
    super.key,
    // required this.restaurantName,
    // required this.restaurantImage,
    // required this.restaurantDistance,
    // required this.restaurantRatings,
    // required this.restaurantLocation,
    // required this.travellingDistance,
    this.restaurantModel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.transparent,
      onTap: onTap,
      titleAlignment: ListTileTitleAlignment.top,
      leading: Image.asset(restaurantModel!.restaurantImage!),
      title: CustomTextWidget(
        text: restaurantModel!.restaurantName!,
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
      ),
      subtitle: Column(
        children: [
          Row(
            children: [
              Icon(
                FontAwesomeIcons.locationPin,
                color: Colors.grey,
                size: 10.0,
              ),
              SizedBox(width: 5.0),
              CustomTextWidget(
                text: '${restaurantModel!.restaurantDistance!.toString()} km',
                fontSize: 10.0,
                textColor: Colors.grey,
              ),
              SizedBox(width: 5.0),
              CustomTextWidget(
                text: '|',
                fontSize: 10.0,
                textColor: Colors.grey,
              ),
              SizedBox(width: 5.0),
              CustomTextWidget(
                text: restaurantModel!.restaurantLocation!,
                fontSize: 10.0,
                textColor: Colors.grey,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextWidget(
                text: '${restaurantModel!.travellingDistance} mins',
                fontSize: 12.0,
              ),
              Row(
                children: [
                  Icon(
                    FontAwesomeIcons.starHalfStroke,
                    size: 12.0,
                  ),
                  SizedBox(width: 5.0),
                  CustomTextWidget(
                      text: restaurantModel!.restaurantRatings.toString()),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
