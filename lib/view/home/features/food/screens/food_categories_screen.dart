import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:now/helper/classes/custom_appbar_widget.dart';
import 'package:now/helper/classes/custom_restaurant_widget.dart';
import 'package:now/helper/widgets/custom_text_widget.dart';
import 'package:now/helper/widgets/searchbar.dart';
import 'package:now/view/home/features/food/models/restaurant_model.dart';
import 'package:now/view/home/features/food/screens/restaurants_detail_screen.dart';

class FoodCategoriesScreen extends StatelessWidget {
  FoodCategoriesScreen({super.key});

  List<RestaurantModel> restaurantList = [
    RestaurantModel(
      restaurantName: 'Silver Leaf Restaurant',
      restaurantImage: 'assets/images/food.PNG',
      restaurantDistance: 6.4,
      restaurantLocation: 'Union Market',
      restaurantRatings: 4.2,
      travellingDistance: 20,
      restaurantMenuModel: [
        RestaurantMenuModel('Club Sandwich', 'assets/images/food.PNG', 9.99,
            4.5, 2, 'Sandwich'),
        RestaurantMenuModel(
            'Pasta Alfredo', 'assets/images/food.PNG', 15.99, 4.2, 1, 'Pasta'),
        RestaurantMenuModel('Chicken Nuggets', 'assets/images/food.PNG', 7.99,
            4.0, 3, 'Fast Food'),
        RestaurantMenuModel(
            'Cheese Pizza', 'assets/images/food.PNG', 12.99, 4.7, 1, 'Pizza'),
        // Add more menu items as needed
      ],
    ),
    RestaurantModel(
      restaurantName: 'Golden Spoon Bistro',
      restaurantImage: 'assets/images/food.PNG',
      restaurantDistance: 8.2,
      restaurantLocation: 'Downtown Square',
      restaurantRatings: 4.5,
      travellingDistance: 15,
      restaurantMenuModel: [
        RestaurantMenuModel('Bacon Cheeseburger', 'assets/images/food.PNG',
            11.99, 4.2, 2, 'Burgers'),
        RestaurantMenuModel('Margherita Pizza', 'assets/images/food.PNG', 14.99,
            4.8, 1, 'Pizza'),
        RestaurantMenuModel('Grilled Chicken Wrap', 'assets/images/food.PNG',
            8.99, 4.3, 3, 'Sandwich'),
        RestaurantMenuModel('French Fries', 'assets/images/food.PNG', 4.99, 4.5,
            2, 'Fast Food'),
        // Add more menu items as needed
      ],
    ),
    // Add more restaurants with their respective menu items
    RestaurantModel(
      restaurantName: 'Spicy Delight Grill',
      restaurantImage: 'assets/images/food.PNG',
      restaurantDistance: 3.5,
      restaurantLocation: 'Central Avenue',
      restaurantRatings: 3.8,
      travellingDistance: 25,
      restaurantMenuModel: [
        RestaurantMenuModel('Spicy Chicken Wings', 'assets/images/food.PNG',
            10.99, 4.0, 2, 'Appetizer'),
        RestaurantMenuModel(
            'Beef Kebabs', 'assets/images/food.PNG', 18.99, 4.5, 1, 'Grilled'),
        RestaurantMenuModel('Vegetable Biryani', 'assets/images/food.PNG',
            12.99, 4.2, 2, 'Rice'),
        // Add more menu items as needed
      ],
    ),
    RestaurantModel(
      restaurantName: 'Sunny Side Cafe',
      restaurantImage: 'assets/images/food.PNG',
      restaurantDistance: 5.0,
      restaurantLocation: 'Sunset Boulevard',
      restaurantRatings: 4.0,
      travellingDistance: 18,
      restaurantMenuModel: [
        RestaurantMenuModel('Classic Breakfast Platter',
            'assets/images/food.PNG', 9.99, 4.5, 1, 'Breakfast'),
        RestaurantMenuModel(
            'Avocado Toast', 'assets/images/food.PNG', 7.99, 4.2, 2, 'Healthy'),
        // Add more menu items as needed
      ],
    ),
    RestaurantModel(
      restaurantName: 'Green Garden Eatery',
      restaurantImage: 'assets/images/food.PNG',
      restaurantDistance: 10.1,
      restaurantLocation: 'Grove Street',
      restaurantRatings: 4.7,
      travellingDistance: 12,
      restaurantMenuModel: [
        RestaurantMenuModel('Vegetarian Pizza', 'assets/images/food.PNG', 13.99,
            4.8, 1, 'Pizza'),
        RestaurantMenuModel(
            'Caesar Salad', 'assets/images/food.PNG', 8.99, 4.3, 3, 'Salad'),
        // Add more menu items as needed
      ],
    ),
    RestaurantModel(
      restaurantName: 'Blue Wave Diner',
      restaurantImage: 'assets/images/food.PNG',
      restaurantDistance: 7.8,
      restaurantLocation: 'Ocean Avenue',
      restaurantRatings: 4.3,
      travellingDistance: 22,
      restaurantMenuModel: [
        RestaurantMenuModel('Shrimp Scampi', 'assets/images/food.PNG', 17.99,
            4.2, 1, 'Seafood'),
        RestaurantMenuModel('Blue Wave Burger', 'assets/images/food.PNG', 11.99,
            4.7, 2, 'Burgers'),
        // Add more menu items as needed
      ],
    ),
    RestaurantModel(
      restaurantName: 'Fire Grill Steakhouse',
      restaurantImage: 'assets/images/food.PNG',
      restaurantDistance: 4.2,
      restaurantLocation: 'Flame Street',
      restaurantRatings: 4.1,
      travellingDistance: 17,
      restaurantMenuModel: [
        RestaurantMenuModel(
            'Filet Mignon', 'assets/images/food.PNG', 29.99, 4.5, 1, 'Steak'),
        RestaurantMenuModel('Grilled Salmon', 'assets/images/food.PNG', 24.99,
            4.3, 2, 'Seafood'),
        // Add more menu items as needed
      ],
    ),
    RestaurantModel(
      restaurantName: 'Mango Tango Fusion',
      restaurantImage: 'assets/images/food.PNG',
      restaurantDistance: 9.5,
      restaurantLocation: 'Tropical Plaza',
      restaurantRatings: 4.6,
      travellingDistance: 14,
      restaurantMenuModel: [
        RestaurantMenuModel('Mango Chicken Curry', 'assets/images/food.PNG',
            15.99, 4.4, 1, 'Curry'),
        RestaurantMenuModel('Tropical Fruit Smoothie', 'assets/images/food.PNG',
            6.99, 4.2, 2, 'Beverage'),
        // Add more menu items as needed
      ],
    ),
    RestaurantModel(
      restaurantName: 'Urban Spice Kitchen',
      restaurantImage: 'assets/images/food.PNG',
      restaurantDistance: 6.9,
      restaurantLocation: 'City Center',
      restaurantRatings: 4.4,
      travellingDistance: 19,
      restaurantMenuModel: [
        RestaurantMenuModel('Paneer Tikka Masala', 'assets/images/food.PNG',
            14.99, 4.6, 1, 'Indian'),
        RestaurantMenuModel(
            'Garlic Naan', 'assets/images/food.PNG', 4.99, 4.3, 3, 'Bread'),
        // Add more menu items as needed
      ],
    ),
    RestaurantModel(
      restaurantName: 'Italiano Pizzeria',
      restaurantImage: 'assets/images/food.PNG',
      restaurantDistance: 12.0,
      restaurantLocation: 'Little Italy',
      restaurantRatings: 4.8,
      travellingDistance: 10,
      restaurantMenuModel: [
        RestaurantMenuModel('Classic Margherita', 'assets/images/food.PNG',
            11.99, 4.7, 1, 'Pizza'),
        RestaurantMenuModel(
            'Pesto Pasta', 'assets/images/food.PNG', 16.99, 4.5, 2, 'Pasta'),
        // Add more menu items as needed
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarWidget(title: 'Foods'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomSearchBar(),
            const SizedBox(height: 10.0),
            CustomTextWidget(text: '28 results found'),
            const SizedBox(height: 10.0),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => const Divider(),
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  final restaurant = restaurantList[index];
                  return CustomRestaurantWidget(
                    onTap: () => Get.to(
                      RestaurantsDetailScreen(
                        restaurantModel: restaurantList[index],
                      ),
                      transition: Transition.rightToLeft,
                    ),
                    restaurantModel: restaurantList[index],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
