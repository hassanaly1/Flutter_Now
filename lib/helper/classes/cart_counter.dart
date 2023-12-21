import 'package:flutter/material.dart';
import 'package:now/helper/widgets/custom_text_widget.dart';

class CartCounter extends StatefulWidget {
  const CartCounter({Key? key}) : super(key: key);

  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItems = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              if (numOfItems > 0) {
                setState(() {
                  numOfItems--;
                });
              }
            });
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black54)),
            padding: EdgeInsets.all(4.0),
            child: const Icon(Icons.remove, size: 12),
          ),
        ),
        SizedBox(height: 4.0),
        CustomTextWidget(
          text: numOfItems.toString().padLeft(2, "0"),
        ),
        SizedBox(height: 4.0),
        GestureDetector(
          onTap: () {
            setState(() {
              numOfItems++;
            });
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black54)),
            padding: EdgeInsets.all(4.0),
            child: const Icon(Icons.add, size: 12),
          ),
        ),
      ],
    );
  }
}
