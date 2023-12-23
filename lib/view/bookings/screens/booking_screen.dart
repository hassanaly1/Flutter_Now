import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:now/helper/widgets/custom_appbar_widget.dart';
import 'package:now/helper/widgets/searchbar.dart';
import 'package:now/view/bookings/screens/documents_bookings.dart';
import 'package:now/view/bookings/screens/food_bookings.dart';
import 'package:now/view/bookings/screens/packages_bokings.dart';
import 'package:now/view/bookings/screens/ride_bokkings.dart';
import 'package:now/view/bookings/screens/rideshare_bookings.dart';

class FoodBookingModel {
  final String userName;
  final String userImage;
  final double price;
  final double feedback;

  FoodBookingModel({
    required this.userName,
    required this.userImage,
    required this.price,
    required this.feedback,
  });
}

class BookingScreen extends StatelessWidget {
  BookingScreen({super.key});

  List<FoodBookingModel> foodBookings = [
    FoodBookingModel(
      userName: 'Pizza Express Delivery',
      userImage: 'assets/images/food.PNG',
      price: 25.00,
      feedback: 4,
    ),
    FoodBookingModel(
      userName: 'Fast & Fresh Food Delivery',
      userImage: 'assets/images/food.PNG',
      price: 30.50,
      feedback: 5,
    ),
    FoodBookingModel(
      userName: 'Burger Junction Delivery',
      userImage: 'assets/images/food.PNG',
      price: 15.25,
      feedback: 3,
    ),
    FoodBookingModel(
      userName: 'Rides - Alice Johnson',
      userImage: 'assets/images/food.PNG',
      price: 40.00,
      feedback: 5,
    ),
    FoodBookingModel(
      userName: 'Bob\'s Food Shack Delivery',
      userImage: 'assets/images/food.PNG',
      price: 18.75,
      feedback: 4,
    ),
    FoodBookingModel(
      userName: 'Eva\'s Sushi Express',
      userImage: 'assets/images/food.PNG',
      price: 22.80,
      feedback: 4,
    ),
    FoodBookingModel(
      userName: 'Pizza Express Delivery',
      userImage: 'assets/images/food.PNG',
      price: 25.00,
      feedback: 4,
    ),
    FoodBookingModel(
      userName: 'Fast & Fresh Food Delivery',
      userImage: 'assets/images/food.PNG',
      price: 30.50,
      feedback: 5,
    ),
    FoodBookingModel(
      userName: 'Burger Junction Delivery',
      userImage: 'assets/images/food.PNG',
      price: 15.25,
      feedback: 3,
    ),
    FoodBookingModel(
      userName: 'Chinese - Alice Johnson',
      userImage: 'assets/images/food.PNG',
      price: 40.00,
      feedback: 5,
    ),
    FoodBookingModel(
      userName: 'Bob\'s Food Shack Delivery',
      userImage: 'assets/images/food.PNG',
      price: 18.75,
      feedback: 4,
    ),
    FoodBookingModel(
      userName: 'Eva\'s Sushi Express',
      userImage: 'assets/images/food.PNG',
      price: 22.80,
      feedback: 4,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarWidget(title: 'My Bookings'),
      body: DefaultTabController(
        length: 5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 5.0),
            const CustomSearchBar(
              hintext: 'Search Bookings',
            ),
            const SizedBox(height: 15.0),
            Container(
              color: Colors.white, // Background color of the TabBar
              child: TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.center,
                labelStyle: GoogleFonts.poppins(
                    fontSize: 14.0, fontWeight: FontWeight.w500),
                tabs: const [
                  Tab(text: 'Food'),
                  Tab(text: 'Share'),
                  Tab(text: 'Ride'),
                  Tab(text: 'Documents'),
                  Tab(text: 'Packages'),
                ],
                labelColor: Colors.black, // Selected tab label color
                unselectedLabelColor: Colors.grey, // Unselected tab label color
                indicatorColor: Colors.transparent, // Remove the indicator
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  FoodBookings(foodBookings: foodBookings), // Ride
                  RideBookings(foodBookings: foodBookings), // Ride
                  RideShareBookings(foodBookings: foodBookings), // Ride
                  DocumentsBookings(foodBookings: foodBookings), // Ride
                  PackageBookings(foodBookings: foodBookings), // Ride
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
