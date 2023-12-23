import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:now/view/bookings/screens/booking_screen.dart';
import 'package:now/view/home/home_screen.dart';
import 'package:now/view/profile/screens/profile_screen.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationController = Get.put(NavigationController());
    return Scaffold(
      body: Obx(
        () => navigationController
            .screens[navigationController.selectedIndex.value],
      ),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          backgroundColor: Colors.white,
          indicatorColor: Colors.white.withOpacity(0.1),
          selectedIndex: navigationController.selectedIndex.value,
          onDestinationSelected: (value) =>
              navigationController.selectedIndex.value = value,
          destinations: const [
            NavigationDestination(
                icon: FaIcon(FontAwesomeIcons.house), label: 'Home'),
            NavigationDestination(
                icon: FaIcon(FontAwesomeIcons.cartShopping), label: 'Bookings'),
            NavigationDestination(
                icon: FaIcon(FontAwesomeIcons.user), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    BookingScreen(),
    const ProfileScreen(),
  ];
}
