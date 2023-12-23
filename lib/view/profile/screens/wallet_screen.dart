import 'package:flutter/material.dart';
import 'package:now/helper/utils/colors.dart';
import 'package:now/helper/widgets/custom_appbar_widget.dart';

import '../../../helper/widgets/custom_text_widget.dart';

class PaymentHistoryModel {
  final String userName;
  final String userImage;
  final double price;
  final double feedback;

  PaymentHistoryModel({
    required this.userName,
    required this.userImage,
    required this.price,
    required this.feedback,
  });
}

class WalletScreen extends StatelessWidget {
  WalletScreen({super.key});

  List<PaymentHistoryModel> paymentHistory = [
    PaymentHistoryModel(
      userName: 'Pizza Express Delivery',
      userImage: 'assets/images/food.PNG',
      price: 25.00,
      feedback: 4,
    ),
    PaymentHistoryModel(
      userName: 'Fast & Fresh Food Delivery',
      userImage: 'assets/images/food.PNG',
      price: 30.50,
      feedback: 5,
    ),
    PaymentHistoryModel(
      userName: 'Burger Junction Delivery',
      userImage: 'assets/images/food.PNG',
      price: 15.25,
      feedback: 3,
    ),
    PaymentHistoryModel(
      userName: 'Rides - Alice Johnson',
      userImage: 'assets/images/food.PNG',
      price: 40.00,
      feedback: 5,
    ),
    PaymentHistoryModel(
      userName: 'Bob\'s Food Shack Delivery',
      userImage: 'assets/images/food.PNG',
      price: 18.75,
      feedback: 4,
    ),
    PaymentHistoryModel(
      userName: 'Eva\'s Sushi Express',
      userImage: 'assets/images/food.PNG',
      price: 22.80,
      feedback: 4,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbarWidget(title: 'My Wallet'),
        body: Column(
          children: [
            Stack(
              //  mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 250,
                  color: Colors.transparent,
                ),
                Container(
                  height: 150,
                  decoration: const BoxDecoration(
                    gradient:
                        LinearGradient(colors: [Colors.red, Colors.lightGreen]),
                  ),
                ),
                Column(
                  children: [
                    ListTile(
                      title: CustomTextWidget(
                        text: 'AVAILABLE BALANCE',
                        fontSize: 12.0,
                        fontWeight: FontWeight.w700,
                      ),
                      subtitle: CustomTextWidget(
                        text: '\$300.00',
                        fontSize: 24.0,
                        fontWeight: FontWeight.w700,
                      ),
                      trailing: GestureDetector(
                        onTap: () {},
                        child: Container(
                            height: 40,
                            width: 120,
                            decoration: const BoxDecoration(
                              color: AppColors.primaryColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Center(
                                  child: CustomTextWidget(
                                text: 'ADD MONEY',
                                fontSize: 10,
                                textColor: Colors.white,
                                fontWeight: FontWeight.w600,
                              )),
                            )),
                      ),
                    ),
                  ],
                ),
                const Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: SizedBox(
                    height: 200,
                    child: Image(
                      image: AssetImage('assets/images/card.png'),
                      //  fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                // height: context.height * 0.5,
                padding: const EdgeInsets.all(12.0),
                // width: double.infinity,
                color: Colors.white60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: 'RECENT TRANSACTIONS',
                      fontSize: 14.0,
                      fontWeight: FontWeight.w700,
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: paymentHistory.length,
                        itemBuilder: (context, index) {
                          final payment = paymentHistory[index];
                          return Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: AssetImage(payment.userImage),
                                radius: 30,
                              ),
                              title: CustomTextWidget(
                                text: payment.userName,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              subtitle: InkWell(
                                onTap: () {},
                                child: CustomTextWidget(
                                  text: 'Give Feedback',
                                  textColor: Colors.red,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              trailing: CustomTextWidget(
                                text: '\$${payment.price.toString()}',
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
