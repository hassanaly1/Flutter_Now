import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:now/helper/widgets/custom_text_widget.dart';
import 'package:now/view/profile/widgets/change_account_image_modal.dart';
import 'package:now/view/profile/widgets/change_account_name_dialog.dart';
import 'package:now/view/profile/widgets/change_account_password_dialog.dart';
import 'package:now/view/profile/widgets/resuabale_profile_tabs.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomTextWidget(
          text: 'Settings',
          fontSize: 16.0,
          fontWeight: FontWeight.w700,
        ),

        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ), // Set the desired icon
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // Other AppBar properties...
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(
              text: 'Settings',
              fontWeight: FontWeight.w700,
            ),
            const SizedBox(height: 10),
            ReUsableProfileTabs(
                icon: CupertinoIcons.settings,
                text: 'Change app color',
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const ChangeAccountNameDialog();
                    },
                  );
                }),
            const SizedBox(height: 25),
            ReUsableProfileTabs(
                icon: CupertinoIcons.settings,
                text: 'Change app typography',
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const ChangeAccountPasswordDialog();
                    },
                  );
                }),
            const SizedBox(height: 25),
            ReUsableProfileTabs(
                icon: CupertinoIcons.settings,
                text: 'Change app language',
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return const ChangeAccountImageModal();
                    },
                  );
                }),
            const SizedBox(height: 25),
            CustomTextWidget(
              text: 'Import',
              fontWeight: FontWeight.w700,
            ),
            const SizedBox(height: 10),
            ReUsableProfileTabs(
                icon: CupertinoIcons.settings,
                text: 'Import from Google Calender',
                onTap: () {}),
          ],
        ),
      ),
    );
  }
}
