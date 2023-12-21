import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:now/helper/classes/custom_appbar_widget.dart';
import 'package:now/helper/widgets/custom_button_widget.dart';
import 'package:now/helper/widgets/custom_text_widget.dart';
import 'package:now/view/home/features/food/models/restaurant_model.dart';
import 'package:now/view/home/features/food/screens/payment_screen.dart';
import 'package:now/view/home/features/food/widgets/custom_item_card.dart';

class CartScreen extends StatelessWidget {
  final RestaurantModel restaurantModel;
  const CartScreen({super.key, required this.restaurantModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarWidget(
        title: 'My Cart',
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey.shade200,
            height: Get.height * 0.6,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, index) {
                return CustomItemCard(
                  restaurantModel: restaurantModel,
                  index: index,
                );
              },
            ),
          ),
          SizedBox(height: 10.0),
          Divider(),
          Container(
            padding: EdgeInsets.all(10.0),
            color: Colors.grey.shade200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(text: 'PAYMENT INFO'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextWidget(
                      text: 'SUB TOTAL',
                      fontWeight: FontWeight.w500,
                    ),
                    CustomTextWidget(text: '\$10.00'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextWidget(
                      text: 'SERVICE FEE',
                      fontWeight: FontWeight.w500,
                    ),
                    CustomTextWidget(text: '\$2.00'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextWidget(
                      text: 'AMOUNT TO PAY',
                      fontWeight: FontWeight.w700,
                    ),
                    CustomTextWidget(text: '\$12.00'),
                  ],
                )
              ],
            ),
          ),
          Divider(),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              height: 50,
              color: Colors.grey.shade200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.locationPin,
                        size: 12.0,
                      ),
                      SizedBox(width: 5.0),
                      CustomTextWidget(text: 'Delivered to: '),
                      SizedBox(width: 5.0),
                      CustomTextWidget(
                        text: 'HOME',
                        textColor: Colors.green,
                        fontWeight: FontWeight.w500,
                      )
                    ],
                  ),
                  CustomTextWidget(text: '4428 Sycamore Lake Road, Wisconsin'),
                ],
              )),
          CustomButton(
            buttonText: 'Pay \$300',
            onTap: () => Get.to(PaymentScreen()),
          ),
        ],
      ),
    );
  }
}
