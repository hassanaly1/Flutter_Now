import 'package:flutter/material.dart';
import 'package:now/helper/widgets/custom_appbar_widget.dart';
import 'package:now/helper/widgets/custom_text_widget.dart';

class TermAndConditionScreen extends StatelessWidget {
  const TermAndConditionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarWidget(title: 'Terms & Condition'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section 1: Introduction
            buildSection(
              'Introduction',
              'Welcome to [Your Mobile Application Name], a mobile application designed to provide a platform for users to access food delivery, package and document delivery, and transportation services. By accessing and using this application, you agree to comply with and be bound by the following terms and conditions. If you do not agree to these terms, please do not use the application.',
            ),

            // Section 2: Acceptance of Terms
            buildSection(
              'Acceptance of Terms',
              'By using [Your Mobile Application Name], you acknowledge that you have read, understood, and agree to be bound by these terms and conditions. These terms may be updated or modified periodically, and continued use of the application constitutes acceptance of any changes.',
            ),

            // Section 3: Services Provided
            buildSection(
              'Services Provided',
              'a. Food Delivery: [Your Mobile Application Name] connects users with local restaurants and facilitates the delivery of food. The application acts as an intermediary between users and restaurants.\n\n'
                  'b. Package and Document Delivery: Users can request the delivery of packages and documents through the application. The application connects users with third-party delivery services to fulfill these requests.\n\n'
                  'c. Transportation Services: [Your Mobile Application Name] offers transportation services similar to an Uber-type model. Users can request rides from nearby drivers through the application.',
            ),

            // Section 4: User Accounts
            buildSection(
              'User Accounts',
              'a. Registration: To use certain features of the application, users may be required to register for an account. Users agree to provide accurate and up-to-date information during the registration process.\n\n'
                  'b. Account Security: Users are responsible for maintaining the security of their account credentials and for all activities that occur under their account. [Your Mobile Application Name] is not liable for any loss or damage resulting from unauthorized access to a user\'s account.',
            ),

            // Section 5: User Responsibilities
            buildSection(
              'User Responsibilities',
              'a. Prohibited Conduct: Users agree not to engage in any prohibited conduct, including but not limited to fraudulent activities, misuse of the application, or any action that violates applicable laws and regulations.\n\n'
                  'b. Content Submission: Users are responsible for the content they submit through the application, including reviews, comments, and ratings. [Your Mobile Application Name] reserves the right to remove or modify any content that violates these terms.',
            ),

            // Section 6: Payments
            buildSection(
              'Payments',
              'a. Payment Information: Users may be required to provide payment information for certain services. By providing this information, users authorize [Your Mobile Application Name] to charge the specified amount for the requested services.\n\n'
                  'b. Fees and Charges: Users acknowledge that fees and charges may apply to certain services. These fees are clearly communicated in the application, and users agree to pay the specified amounts.',
            ),

            // Section 7: Third-Party Services
            buildSection(
              'Third-Party Services',
              'a. Third-Party Partners: [Your Mobile Application Name] may collaborate with third-party service providers for food delivery, package and document delivery, and transportation services. Users acknowledge that these third parties have their terms and conditions, and [Your Mobile Application Name] is not responsible for their actions or policies.\n\n'
                  'b. Links to Third-Party Websites: The application may contain links to third-party websites. [Your Mobile Application Name] is not responsible for the content, accuracy, or policies of these external sites.',
            ),

            // Section 8: Privacy Policy
            buildSection(
              'Privacy Policy',
              'a. Privacy: [Your Mobile Application Name] values user privacy. The application\'s privacy policy outlines how user data is collected, used, and protected. By using the application, users agree to the terms of the privacy policy.\n\n'
                  'b. Data Security: [Your Mobile Application Name] employs industry-standard measures to secure user data. However, no method of transmission over the internet or electronic storage is completely secure.',
            ),

            // Section 9: Disclaimers
            buildSection(
              'Disclaimers',
              'a. Service Availability: [Your Mobile Application Name] strives to provide reliable services, but cannot guarantee uninterrupted access or availability of the application.\n\n'
                  'b. Accuracy of Information: While [Your Mobile Application Name] endeavors to provide accurate information, it does not warrant the completeness, accuracy, or reliability of the content within the application.',
            ),

            // Section 10: Limitation of Liability
            buildSection(
              'Limitation of Liability',
              'a. Indirect Damages: [Your Mobile Application Name] is not liable for any indirect, incidental, special, or consequential damages arising out of or in connection with the use of the application.\n\n'
                  'b. User Interactions: Users are solely responsible for interactions with other users, drivers, and third parties facilitated by [Your Mobile Application Name]. [Your Mobile Application Name] is not liable for any actions, omissions, or conduct of these parties.',
            ),

            // Section 11: Governing Law
            buildSection(
              'Governing Law',
              'These terms and conditions are governed by and construed in accordance with the laws of [Your Jurisdiction]. Any dispute arising out of or related to these terms shall be resolved in the courts of [Your Jurisdiction].',
            ),

            // Section 12: Contact Information
            buildSection(
              'Contact Information',
              'For any inquiries or concerns related to these terms and conditions, please contact [Your Contact Information].',
            ),

            // Footer: Agreement Statement
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: CustomTextWidget(
                text:
                    'By using [Your Mobile Application Name], you agree to abide by these terms and conditions. Please review them carefully. If you do not agree to these terms, do not use the application.',
                maxLines: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          titleAlignment: ListTileTitleAlignment.top,
          leading: CustomTextWidget(
            text: '*',
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
          title: CustomTextWidget(
            text: title,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
          subtitle: CustomTextWidget(
            text: content,
            fontSize: 10.0,
            maxLines: 20,
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
