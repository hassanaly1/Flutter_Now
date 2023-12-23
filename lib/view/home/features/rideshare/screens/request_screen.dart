import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:now/controllers/carpool_controller.dart';
import 'package:now/helper/widgets/custom_appbar_widget.dart';
import 'package:now/helper/widgets/request_ride_widget.dart';
import 'package:now/models/request_ride_model.dart';

class RequestRides extends StatefulWidget {
  const RequestRides({super.key});

  @override
  State<RequestRides> createState() => _RequestRidesState();
}

class _RequestRidesState extends State<RequestRides> {
  String resetUrl = "assets/reset.png";
  @override
  Widget build(BuildContext context) {
    List<RequesRidesModel> availableRides = [
      RequesRidesModel(
          id: 1,
          name: "Alex halin",
          fromLocation: 'New York',
          toLocation: 'San Francisco',
          image: 'assets/images/person.jpg',
          seats: 3),
      RequesRidesModel(
          id: 2,
          name: "Rowan keli",
          fromLocation: 'Los Angeles',
          toLocation: 'Las Vegas',
          image: 'assets/images/person.jpg',
          seats: 3),
      RequesRidesModel(
          id: 2,
          name: "Andrew",
          fromLocation: 'Los Angeles',
          toLocation: 'Las Vegas',
          image: 'assets/images/person.jpg',
          seats: 3),
      RequesRidesModel(
          id: 2,
          name: "Kirani",
          fromLocation: 'Los Angeles',
          toLocation: 'Las Vegas',
          image: 'assets/images/person.jpg',
          seats: 3),

      // Add more dummy data as needed...
    ];
    final controller = Get.put(CarpoolController());

    return Scaffold(
      appBar: CustomAppbarWidget(
        title: "Requested Rides",
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: availableRides.length,
                  itemBuilder: (context, index) {
                    return RequestRideWidget(
                      imageURl: availableRides[index].image.toString(),
                      fromLocation:
                          availableRides[index].fromLocation.toString(),
                      toLocation: availableRides[index].toLocation.toString(),
                      seats: availableRides[index].seats.toString(),
                      name: availableRides[index].name.toString(),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
