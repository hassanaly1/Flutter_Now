import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DateTimeController extends GetxController {
  Rx<DateTime> fromDate = DateTime.now().obs;
  Rx<TimeOfDay> fromTime = TimeOfDay.now().obs;
  Rx<TimeOfDay> toTime = TimeOfDay.now().obs;

  Future<void> selectFromDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: fromDate.value,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    if (picked != null && picked != fromDate.value) {
      fromDate.value = picked;
    }
  }

  Future<void> selectFromTime(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: fromTime.value,
    );
    if (picked != null && picked != fromTime.value) {
      fromTime.value = picked;
    }
  }

  Future<void> selectToTime(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: toTime.value,
    );
    if (picked != null && picked != toTime.value) {
      toTime.value = picked;
    }
  }
}
