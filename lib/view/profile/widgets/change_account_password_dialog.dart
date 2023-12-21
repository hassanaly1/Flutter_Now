import 'package:flutter/material.dart';
import 'package:now/helper/widgets/custom_text_widget.dart';
import 'package:now/utils/colors.dart';
import 'package:now/view/profile/widgets/change_account_name_dialog.dart';

class ChangeAccountPasswordDialog extends StatefulWidget {
  const ChangeAccountPasswordDialog({super.key});

  @override
  State<ChangeAccountPasswordDialog> createState() =>
      _ChangeAccountPasswordDialogState();
}

class _ChangeAccountPasswordDialogState
    extends State<ChangeAccountPasswordDialog> {
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        children: [
          CustomTextWidget(
            text: 'Change Account Password',
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SettingsTextField(
                controller: _currentPasswordController,
                hintText: 'Old Password'),
            SizedBox(height: 15.0),
            SettingsTextField(
                controller: _newPasswordController, hintText: 'New Password'),
          ],
        ),
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
