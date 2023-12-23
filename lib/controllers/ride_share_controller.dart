import 'package:get/get.dart';

class RideshareController extends GetxController{

  RxInt pressedIndex=0.obs;

  void toggleTileColor(int index) {
    pressedIndex.value=index;
  }



  RxBool firstRadioSelected = false.obs;
  RxBool secondRadioSelected = false.obs;

  void selectRadiofirst(){
    firstRadioSelected.value=!firstRadioSelected.value;
    secondRadioSelected.value=false;
  }

  void selectRadioSecond(){
    secondRadioSelected.value=!secondRadioSelected.value;
    firstRadioSelected.value=false;
  }
  var selectedRadio = 0.obs;

  void setSelectedRadio(int val) {
    selectedRadio.value = val;
  }

  RxInt selectedPaymentIndex = 0.obs;

  void selectPaymentIndex( int index){
    selectedPaymentIndex.value=index;
  }


  var rating = 0.0.obs;

  void setRating(double value) {
    rating.value = value;
  }



}





