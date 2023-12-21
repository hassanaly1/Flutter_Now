import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:now/helper/classes/custom_appbar_widget.dart';
import 'package:now/helper/widgets/custom_text_widget.dart';

class Review {
  final String name;
  final double rating;
  final String review;

  Review({required this.name, required this.rating, required this.review});
}

class ReviewScreen extends StatelessWidget {
  final List<Review> reviews = [
    Review(
      name: 'Emily Thompson',
      rating: 4.5,
      review:
          'I had a wonderful experience with the food delivery service. The food was delicious, and the delivery was faster than I expected. Definitely recommending to friends and family!',
    ),
    Review(
      name: 'John Davis',
      rating: 3.8,
      review:
          'The overall experience was good. The food quality was decent, but the delivery took a bit longer than usual. I appreciate the effort, but there is room for improvement.',
    ),
    Review(
      name: 'Sophia Martinez',
      rating: 5.0,
      review:
          'Exceptional service! The food arrived on time, and the taste was outstanding. I\'m definitely going to be a regular customer. Keep up the great work!',
    ),
    Review(
      name: 'Michael Wilson',
      rating: 4.2,
      review:
          'I recently tried the food delivery service, and it was a delightful experience. The menu variety is impressive, and the quality of the food exceeded my expectations. Highly recommended!',
    ),
    Review(
      name: 'Olivia Smith',
      rating: 4.8,
      review:
          'Im extremely satisfied with the service. The food was fresh, and the delivery person was polite. The app interface is user-friendly, making the entire process smooth. Will order again!',
    ),
    Review(
      name: 'William Brown',
      rating: 4.0,
      review:
          'Overall, a good experience. The food was tasty, and the delivery was on time. I had a minor issue with the app, but customer support was quick to assist. Will give it another try!',
    ),
    Review(
      name: 'Ava Anderson',
      rating: 5.0,
      review:
          'Absolutely fantastic! From ordering to delivery, everything was perfect. The food was hot and delicious. I highly recommend this service to anyone looking for a hassle-free dining experience.',
    ),
    Review(
      name: 'Liam Thomas',
      rating: 3.5,
      review:
          'Decent service, but the delivery time was longer than expected. The food quality was good, but I hope they can improve on their delivery speed. Will consider ordering again in the future.',
    ),
    Review(
      name: 'Isabella Johnson',
      rating: 4.7,
      review:
          'I enjoyed the variety of dishes available. The flavors were rich, and the portion sizes were generous. The delivery person was friendly, making the experience even better. Will order again!',
    ),
    Review(
      name: 'Ethan Miller',
      rating: 4.2,
      review:
          'The food exceeded my expectations, and the delivery was prompt. The app is easy to navigate, making the ordering process convenient. I will definitely be a repeat customer. Great job!',
    ),
  ];

  ReviewScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarWidget(title: 'All Reviews'),
      body: SingleChildScrollView(
        child: Column(
          children: reviews.map((review) {
            return CustomReviewWidget(review: review);
          }).toList(),
        ),
      ),
    );
  }
}

class CustomReviewWidget extends StatelessWidget {
  final Review review;

  const CustomReviewWidget({
    Key? key,
    required this.review,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(8.0),
        height: Get.height * 0.2,
        color: Colors.grey.shade200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(
              text: review.name,
              fontWeight: FontWeight.w400,
            ),
            Row(
              children: [
                Icon(
                  FontAwesomeIcons.starHalfStroke,
                  size: 12.0,
                ),
                SizedBox(width: 5.0),
                CustomTextWidget(
                  text: review.rating.toStringAsFixed(1),
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            CustomTextWidget(
              text: review.review,
              fontSize: 12.0,
              maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }
}
