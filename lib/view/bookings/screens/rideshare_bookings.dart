import 'package:flutter/material.dart';
import 'package:now/helper/widgets/custom_text_widget.dart';
import 'package:now/view/bookings/screens/booking_screen.dart';

class RideShareBookings extends StatelessWidget {
  const RideShareBookings({
    super.key,
    required this.foodBookings,
  });

  final List<FoodBookingModel> foodBookings;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: foodBookings.length,
        itemBuilder: (context, index) {
          final payment = foodBookings[index];
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
                  text: 'Delivered',
                  textColor: Colors.green,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
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
    );
  }
}
