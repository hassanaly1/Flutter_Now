import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:now/controllers/carpool_controller.dart';
import 'package:now/helper/widgets/available_ride_share.dart';
import 'package:now/helper/widgets/custom_appbar_widget.dart';
import 'package:now/helper/widgets/custom_texxtfield.dart';
import 'package:now/helper/widgets/searchbar.dart';
import 'package:now/models/available_rides_model.dart';

class AvailableRides extends StatefulWidget {
  const AvailableRides({super.key});

  @override
  State<AvailableRides> createState() => _AvailableRidesState();
}

class _AvailableRidesState extends State<AvailableRides> {
  FocusNode myfocus = FocusNode();

  String resetUrl = "assets/images/reset.png";
  @override
  Widget build(BuildContext context) {
    List<AvailableRidesModel> availableRides = [
      AvailableRidesModel(
          id: 1,
          fromLocation: 'New York',
          toLocation: 'San Francisco',
          date: '20-12-2023',
          time: '10:45 AM',
          vehicleNo: 'ABC-123',
          image: 'assets/images/person.jpg',
          rating: 4.5,
          type: 'car',
          amount: 400,
          seats: 3),
      AvailableRidesModel(
          id: 2,
          fromLocation: 'Los Angeles',
          toLocation: 'Las Vegas',
          date: '20-12-2023',
          time: '10:45 AM',
          vehicleNo: 'XYZ-456',
          image: 'assets/images/person.jpg',
          rating: 4.2,
          type: 'bike',
          amount: 400,
          seats: 3),
      AvailableRidesModel(
          id: 2,
          fromLocation: 'Los Angeles',
          toLocation: 'Las Vegas',
          date: '20-12-2023',
          time: '10:45 AM',
          vehicleNo: 'XYZ-456',
          image: 'assets/images/person.jpg',
          rating: 4.2,
          type: 'car',
          amount: 400,
          seats: 3),
      AvailableRidesModel(
          id: 2,
          fromLocation: 'Los Angeles',
          toLocation: 'Las Vegas',
          date: '20-12-2023',
          time: '10:45 AM',
          vehicleNo: 'XYZ-456',
          image: 'assets/images/person.jpg',
          rating: 4.2,
          type: 'car',
          amount: 400,
          seats: 3),
      AvailableRidesModel(
          id: 2,
          fromLocation: 'Los Angeles',
          toLocation: 'Las Vegas',
          date: '20-12-2023',
          time: '10:45 AM',
          vehicleNo: 'XYZ-456',
          image: 'assets/images/person.jpg',
          rating: 4.2,
          type: 'car',
          amount: 400,
          seats: 3),
      // Add more dummy data as needed...
    ];
    final controller = Get.put(CarpoolController());

    return Scaffold(
      appBar: CustomAppbarWidget(
        title: "Avaialable Rides",
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const CustomSearchBar(
              hintext: 'Search by destination',
              search: true,
              icon: CupertinoIcons.search,
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Row(
              children: [
                Expanded(
                    child: CustomTextField(
                  hintext: "Time",
                  icon: CupertinoIcons.time_solid,
                  enableText: false,
                  onTap: () {
                    controller.selectTime(context);
                  },
                )),
                SizedBox(
                  width: Get.width * 0.02,
                ),

                Expanded(
                    child: CustomTextField(
                  hintext: "Date",
                  icon: CupertinoIcons.calendar,
                  enableText: false,
                  onTap: () {
                    controller.selectFromDate(context);
                  },
                )),
                SizedBox(
                  width: Get.width * 0.02,
                ),

                Image.asset(
                  resetUrl,
                  height: Get.height * 0.05,
                ),

                // Expanded(
                //   child: ListView.builder(itemBuilder: (context,index){
                //   }),
                // )
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: availableRides.length,
                  itemBuilder: (context, index) {
                    return PostRideWidget(
                      vehicleNo: availableRides[index].vehicleNo.toString(),
                      imageURl: availableRides[index].image.toString(),
                      fromLocation:
                          availableRides[index].fromLocation.toString(),
                      date: availableRides[index].date.toString(),
                      toLocation: availableRides[index].toLocation.toString(),
                      amount: availableRides[index].amount!,
                      time: availableRides[index].time.toString(),
                      type: availableRides[index].type.toString(),
                      seats: availableRides[index].seats.toString(),
                      rating: availableRides[index].rating!,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
