import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:now/helper/utils/colors.dart';
import 'package:now/start_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NOW',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: true,
      ),
      home: StartScreen(),
    );
  }
}
