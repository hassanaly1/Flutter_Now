import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:now/helper/widgets/custom_text_widget.dart';
import 'package:now/view/profile/screens/feedback_screen.dart';
import 'package:now/view/profile/screens/saved_address_screen.dart';
import 'package:now/view/profile/screens/terms_and_condition_screen.dart';
import 'package:now/view/profile/screens/wallet_screen.dart';
import 'package:now/view/profile/widgets/change_account_image_modal.dart';
import 'package:now/view/profile/widgets/change_account_name_dialog.dart';
import 'package:now/view/profile/widgets/change_account_password_dialog.dart';
import 'package:now/view/profile/widgets/resuabale_profile_tabs.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            child: Column(
              children: [
                //Text and Image
                CustomTextWidget(
                    text: 'Profile',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700),
                const SizedBox(height: 15),
                const CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 45,
                  backgroundImage: AssetImage('assets/images/person.jpg'),
                ),
                const SizedBox(height: 15),
                CustomTextWidget(
                    text: 'Andrew James',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                          text: 'Settings',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500),
                      const SizedBox(height: 10),
                      // ReUsableProfileTabs(
                      //     icon: CupertinoIcons.settings,
                      //     text: 'App Settings',
                      //     onTap: () {
                      //       Get.to(const SettingsScreen());
                      //     }),
                      // const SizedBox(height: 25),
                      CustomTextWidget(
                        text: 'Account',
                        fontSize: 14.0,
                      ),
                      const SizedBox(height: 10),
                      ReUsableProfileTabs(
                          icon: CupertinoIcons.person,
                          text: 'Change Account Name',
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
                          icon: Icons.password,
                          text: 'Change Account Password',
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
                          icon: Icons.image_search_outlined,
                          text: 'Change Account Image',
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return const ChangeAccountImageModal();
                              },
                            );
                          }),
                      const SizedBox(height: 25),
                      ReUsableProfileTabs(
                          icon: Icons.location_city,
                          text: 'Saved Addresses',
                          onTap: () {
                            Get.to(const SavedAddressScreen(),
                                transition: Transition.rightToLeft);
                          }),
                      const SizedBox(height: 25),
                      ReUsableProfileTabs(
                          icon: Icons.wallet,
                          text: 'Wallet',
                          onTap: () {
                            Get.to(WalletScreen(),
                                transition: Transition.rightToLeft);
                          }),
                      const SizedBox(height: 25),
                      CustomTextWidget(text: 'About', fontSize: 14.0),
                      const SizedBox(height: 10),
                      ReUsableProfileTabs(
                          icon: Icons.feedback,
                          text: 'Help & Feedback',
                          onTap: () {
                            Get.to(FeedbackScreen(),
                                transition: Transition.rightToLeft);
                          }),
                      const SizedBox(height: 25),
                      ReUsableProfileTabs(
                          icon: Icons.support,
                          text: 'Terms & Condition',
                          onTap: () {
                            Get.to(TermAndConditionScreen(),
                                transition: Transition.rightToLeft);
                          }),
                      const SizedBox(height: 25),
                      Row(
                        children: [
                          const Icon(Icons.logout, color: Colors.red),
                          const SizedBox(width: 5),
                          CustomTextWidget(
                              text: 'Logout',
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                              textColor: Colors.red),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
