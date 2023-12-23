import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarpoolController extends GetxController{

  Rx<TimeOfDay> time = TimeOfDay.now().obs;
  Rx<DateTime> date = DateTime.now().obs;


  RxInt counterValue=0.obs;
 void counterAddition(){
   counterValue.value++;
 }
void counterSubtraction(){
  counterValue.value--;
}

  RxInt pressedIndex=0.obs;

  void toggleTileColor(int index) {
    pressedIndex.value=index;
  }


Future<void> selectTime(BuildContext context) async {
  TimeOfDay? picked = await showTimePicker(
    context: context,
    initialTime: time.value,
  );
  if (picked != null && picked != time.value) {
    time.value = picked;
  }
}

  Future<void> selectFromDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date.value,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    if (picked != null && picked != date.value) {
      date.value = picked;
    }
  }
}