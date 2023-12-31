import 'package:flutter/material.dart';
import 'package:now/helper/widgets/custom_text_widget.dart';

class CustomAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  List<Widget>? actions;
  CustomAppbarWidget({super.key, required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: CustomTextWidget(
        text: title,
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
      ),
      actions: actions,
      centerTitle: true,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(40.0);
}
