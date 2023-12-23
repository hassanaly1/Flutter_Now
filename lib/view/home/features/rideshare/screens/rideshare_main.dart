import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:now/helper/widgets/ride_share_main_container.dart';
import 'package:now/view/home/features/rideshare/screens/available_rides.dart';
import 'package:now/view/home/features/rideshare/screens/post_ride.dart';
import 'package:now/view/home/features/rideshare/screens/request_screen.dart';

class RideShareScreen extends StatefulWidget {
  const RideShareScreen({
    super.key,
  });
  static const LatLng _karachi = LatLng(24.8607, 67.0011);

  @override
  State<RideShareScreen> createState() => _RideShareScreenState();
}

class _RideShareScreenState extends State<RideShareScreen> {
  @override
  Widget build(BuildContext context) {
    String locationUrl = "assets/images/location.png";

    return Scaffold(
        body: Stack(
      children: [
        const GoogleMap(
          initialCameraPosition:
              CameraPosition(target: RideShareScreen._karachi, zoom: 13),
        ),
        Positioned(
          bottom: 260,
          left: 10,
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              margin: EdgeInsets.all(8),
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: const Center(
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
              decoration: const BoxDecoration(color: Colors.white),
              height: Get.height * 0.330,
              width: Get.width,
              child: const ContainerRow()),
        ),
      ],
    ));
  }
}

class ContainerRow extends StatelessWidget {
  const ContainerRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomContainer(
            onTap: () {
              Get.to(const PostRide());
            },
            text: 'Post Ride',
            backgroundImage: const AssetImage('assets/images/motorbike.png'),
          ),
          CustomContainer(
            onTap: () {
              Get.to(const AvailableRides());
            },
            text: 'Available Rides',
            backgroundImage: const AssetImage('assets/images/available.png'),
          ),
          CustomContainer(
            onTap: () {
              Get.to(const RequestRides());
            },
            text: 'Requests',
            backgroundImage: const AssetImage('assets/images/share.png'),
          ),
        ],
      ),
    );
  }
}
