import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:now/helper/widgets/custom_text_widget.dart';
import 'package:now/utils/colors.dart';

class ChangeAccountNameDialog extends StatefulWidget {
  const ChangeAccountNameDialog({super.key});

  @override
  State<ChangeAccountNameDialog> createState() =>
      _ChangeAccountNameDialogState();
}

class _ChangeAccountNameDialogState extends State<ChangeAccountNameDialog> {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        children: [
          CustomTextWidget(
            text: 'Change Account Name',
            fontWeight: FontWeight.w700,
            fontSize: 14.0,
          ),
          const Divider(
            color: Colors.black54,
            thickness: 2,
          )
        ],
      ),
      content: SizedBox(
        width: double.infinity,
        child: SettingsTextField(
            controller: _nameController, hintText: 'Enter Name'),
      ),
      actions: [
        TextButton(
          child: CustomTextWidget(
            text: 'Save',
            textColor: AppColors.primaryColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: CustomTextWidget(
            text: 'Cancel',
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

class SettingsTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  const SettingsTextField({super.key, this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: GoogleFonts.poppins(fontSize: 12.0),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(fontSize: 12.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: const BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: const BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
