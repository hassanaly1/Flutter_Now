class RestaurantModel {
  final String? restaurantName;
  final String? restaurantImage;
  final double? restaurantDistance;
  final String? restaurantLocation;
  final double? restaurantRatings;
  final int? travellingDistance;
  final List<RestaurantMenuModel>? restaurantMenuModel;

  RestaurantModel({
    this.restaurantName,
    this.restaurantImage,
    this.restaurantDistance,
    this.restaurantLocation,
    this.restaurantRatings,
    this.travellingDistance,
    this.restaurantMenuModel,
  });
}

class RestaurantMenuModel {
  final String name;
  final String image;
  final double price;
  final double ratings;
  final int quantity;
  final String category;
  String? description;

  RestaurantMenuModel(this.name, this.image, this.price, this.ratings,
      this.quantity, this.category,
      {this.description =
          "Our menu is a symphony of flavors, offering a diverse range of dishes crafted with precision and passion. From savory classics to innovative creations, each bite is a celebration of taste and quality. Whether you crave the comfort of a hearty burger, the savoriness of a perfectly grilled steak, the freshness of a vibrant salad, or the exotic spices of global cuisines, our menu is designed to satisfy every palate"});
}
