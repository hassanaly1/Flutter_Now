import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:now/helper/classes/custom_restaurant_widget.dart';
import 'package:now/helper/widgets/custom_text_widget.dart';
import 'package:now/view/home/features/food/models/restaurant_model.dart';
import 'package:now/view/home/features/food/screens/cart_screen.dart';
import 'package:now/view/home/features/food/screens/reviews_screen.dart';
import 'package:now/view/home/features/food/widgets/custom_item_card.dart';
import 'package:now/view/home/features/food/widgets/food_bottom_sheet.dart';

class RestaurantsDetailScreen extends StatelessWidget {
  final RestaurantModel restaurantModel;
  // final String restaurantName;
  // final String restaurantImage;
  // final double restaurantDistance;
  // final double restaurantRatings;
  // final String restaurantLocation;
  // final int travellingDistance;

  const RestaurantsDetailScreen({
    super.key,
    required this.restaurantModel,
    // required this.restaurantName,
    // required this.restaurantImage,
    // required this.restaurantDistance,
    // required this.restaurantRatings,
    // required this.restaurantLocation,
    // required this.travellingDistance,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () => Get.to(
                    CartScreen(restaurantModel: restaurantModel),
                    transition: Transition.rightToLeft),
                icon: const Icon(
                  FontAwesomeIcons.shoppingCart,
                  size: 20.0,
                ),
              ))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomRestaurantWidget(
            onTap: () {},
            restaurantModel: restaurantModel,
          ),
          TextButton(
              onPressed: () =>
                  Get.to(ReviewScreen(), transition: Transition.rightToLeft),
              child: CustomTextWidget(
                text: 'All Reviews >',
                textAlign: TextAlign.end,
                fontSize: 12.0,
              )),
          DefaultTabController(
            length: 4,
            child: TabBar(
              tabAlignment: TabAlignment.fill,
              labelStyle: GoogleFonts.poppins(
                  fontSize: 12.0, fontWeight: FontWeight.w700),
              unselectedLabelStyle: GoogleFonts.poppins(fontSize: 12.0),
              tabs: const [
                Tab(text: 'FAST FOOD'),
                Tab(text: 'BURGERS'),
                Tab(text: 'PIZZA'),
                Tab(text: 'CHINESE'),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: restaurantModel.restaurantMenuModel!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => FoodBottomSheet(
                          restaurantModel: restaurantModel,
                          index: index,
                        ),
                      );
                    },
                    child: CustomItemCard(
                      restaurantModel: restaurantModel,
                      index: index,
                    ));
              },
              separatorBuilder: (context, index) => const Divider(),
            ),
          )
        ],
      ),
    );
  }
}
