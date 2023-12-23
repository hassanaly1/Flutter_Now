import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSearchBar extends StatelessWidget {
  final String hintext;
  final VoidCallback? onTap;
  final IconData? icon;
  final Color? color;
  final bool? search;
  const CustomSearchBar(
      {super.key,
      required this.hintext,
      this.onTap,
      this.icon,
      this.color,
      this.search});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.grey[200],
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                cursorOpacityAnimates: true,
                enabled: search,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    icon,
                    color: color,
                  ),
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
    );
  }
}
