import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final String hintext;
  final VoidCallback? onTap;
  final VoidCallback? iconOnTap;
  final IconData? icon;
  final Color? color;
  final bool? enableText;
  final int mxLines;
  const CustomTextField(
      {super.key,
      required this.hintext,
      this.onTap,
      this.icon,
      this.color,
      this.enableText,
      this.mxLines = 1,
      this.iconOnTap});
  @override
  Widget build(BuildContext context) {
    FocusNode focusNode = FocusNode();
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.grey[200],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: iconOnTap,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Icon(icon, color: color),
                  ),
                ),
                Expanded(
                  child: TextField(
                    onSubmitted: (text) {
                      // Handle the submitted text
                      focusNode.unfocus(); // Dismiss the keyboard
                    },
                    maxLines: mxLines,
                    enabled: enableText,
                    decoration: InputDecoration(
                      hintText: hintext,
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.black87,
                      ),
                      border: InputBorder.none,
                    ),
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
