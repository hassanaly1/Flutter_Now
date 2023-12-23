import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:now/controllers/ride_share_controller.dart';
import 'package:now/helper/widgets/custom_appbar_widget.dart';
import 'package:now/helper/widgets/custom_button_widget.dart';
import 'package:now/helper/widgets/custom_text_widget.dart';
import 'package:now/view/home/features/uber/screens/drivers_screen.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

List<String> paymentTypes = [
  'My Wallet',
  'Cash',
  'Paypal',
];

class _PaymentScreenState extends State<PaymentScreen> {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cardExpirationController =
      TextEditingController();
  final TextEditingController cardSecurityCodeController =
      TextEditingController();
  int selectedPaymentIndex = 0;
  final controller = Get.put(RideshareController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarWidget(title: 'Payment Methods'),
      body: Column(
        children: [
          CustomTextWidget(
            text: 'Select the payment method you want to use',
            fontSize: 12,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: paymentTypes.length,
            itemBuilder: (context, index) {
              return CustomPaymetWidget(
                text: paymentTypes[index],
                icon: FontAwesomeIcons.paypal,
                index: index,
                isSelected: controller.selectedPaymentIndex.value == index,
                onTap: () {
                  controller.selectPaymentIndex(index);
                  // setState(() {
                  //   selectedPaymentIndex = index;
                  // });
                },
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: CustomButton(
        buttonText: 'Continue',
        onTap: () {
          Get.to(DriversScreen());
          print("payment button tapped");
        },
      ),
    );
  }
}

class CustomPaymetWidget extends StatelessWidget {
  final String text;
  final int index;
  final bool isSelected;
  final IconData icon;
  final VoidCallback onTap;

  const CustomPaymetWidget(
      {super.key,
      required this.text,
      required this.index,
      required this.isSelected,
      required this.onTap,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RideshareController());

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
        ),
        child: GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
                leading: Icon(
                  icon,
                  color: CupertinoColors.activeBlue,
                ),
                title: CustomTextWidget(
                  text: text,
                  fontWeight: FontWeight.w500,
                ),
                trailing: Obx(() {
                  return Icon(
                    controller.selectedPaymentIndex.value == index
                        ? Icons.radio_button_checked_rounded
                        : Icons.radio_button_off,
                    color: Colors.black,
                  );
                })),
          ),
        ),
      ),
    );
  }
}
