import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:now/helper/widgets/custom_button_widget.dart';
import 'package:now/helper/widgets/custom_text_widget.dart';
import 'package:now/view/home/features/food/models/restaurant_model.dart';
import 'package:readmore/readmore.dart';

class FoodBottomSheet extends StatelessWidget {
  final RestaurantModel? restaurantModel;
  final int index;
  const FoodBottomSheet({super.key, this.restaurantModel, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
        height: Get.height * 0.7,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  image: DecorationImage(
                      image: AssetImage(
                          restaurantModel!.restaurantMenuModel![index].image),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  )),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 250,
                decoration: const BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined),
                            CustomTextWidget(
                              text: restaurantModel!.restaurantName!,
                              fontWeight: FontWeight.w400,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextWidget(
                              text: restaurantModel!
                                  .restaurantMenuModel![index].name,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                            CustomTextWidget(
                              text:
                                  '\$ ${restaurantModel!.restaurantMenuModel![index].price.toString()}',
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        RatingBar.builder(
                          initialRating: restaurantModel!
                              .restaurantMenuModel![index!].ratings,
                          itemSize: 20,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                          ignoreGestures: true,
                        ),
                        SizedBox(height: 10.0),
                        CustomTextWidget(
                          text: 'Description',
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                        ),
                        ReadMoreText(
                          restaurantModel!
                                  .restaurantMenuModel?[index].description ??
                              "",
                          trimLines: 4,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                          colorClickableText: Colors.pink,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: 'Show more',
                          trimExpandedText: ' Show less',
                          moreStyle: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          lessStyle: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        CustomButton(
                          onTap: () {},
                          buttonText: 'Add to Cart',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
