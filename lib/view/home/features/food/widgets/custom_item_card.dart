import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:now/helper/classes/cart_counter.dart';
import 'package:now/helper/widgets/custom_text_widget.dart';
import 'package:now/view/home/features/food/models/restaurant_model.dart';

class CustomItemCard extends StatelessWidget {
  final int? index;
  final RestaurantModel? restaurantModel;
  const CustomItemCard({
    super.key,
    this.restaurantModel,
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
        ),
        child: Row(
          children: [
            Image.asset(restaurantModel!.restaurantMenuModel![index!].image),
            const SizedBox(width: 8.0), // Leading
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomTextWidget(
                  text: restaurantModel!.restaurantMenuModel![index!].name,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ), // Title
                CustomTextWidget(
                  text: '\$3.00',
                  fontSize: 12.0,
                ),
                RatingBar.builder(
                  initialRating:
                      restaurantModel!.restaurantMenuModel![index!].ratings,
                  itemSize: 15,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  ignoreGestures: true,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ) // Subtitle
              ],
            ),
            const Spacer(),
            const CartCounter(), // Trailing
          ],
        ),
      ),
    );
  }
}
