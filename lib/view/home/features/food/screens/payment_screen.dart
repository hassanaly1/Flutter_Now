import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:now/helper/classes/custom_appbar_widget.dart';
import 'package:now/helper/widgets/custom_button_widget.dart';
import 'package:now/helper/widgets/custom_text_widget.dart';

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
  int selectedPaymentIndex = -1;

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
                isSelected: selectedPaymentIndex == index,
                onTap: () {
                  setState(() {
                    selectedPaymentIndex = index;
                  });
                },
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: CustomButton(
        buttonText: 'Continue',
        onTap: () {},
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

  CustomPaymetWidget(
      {required this.text,
      required this.index,
      required this.isSelected,
      required this.onTap,
      required this.icon});

  @override
  Widget build(BuildContext context) {
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
              trailing: Icon(
                isSelected
                    ? Icons.radio_button_checked_rounded
                    : Icons.radio_button_off,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
