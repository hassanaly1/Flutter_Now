import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:now/helper/widgets/custom_appbar_widget.dart';
import 'package:now/helper/widgets/custom_button_widget.dart';
import 'package:now/helper/widgets/custom_text_widget.dart';

class DocumentSelectionScreen extends StatefulWidget {
  const DocumentSelectionScreen({super.key});

  @override
  State<DocumentSelectionScreen> createState() =>
      _DocumentSelectionScreenState();
}

class _DocumentSelectionScreenState extends State<DocumentSelectionScreen> {
  List<String> selectedTypes = [];
  List<String> documentTypes = [
    'Resume',
    'Cover Letter',
    'Research Paper',
    'Contract',
    'Invoice',
    'Presentation',
    'Proposal',
    'Agreement',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarWidget(title: 'Documents'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12.0),
            color: Colors.grey.shade200,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter Pickup Location',
                    label: CustomTextWidget(text: 'PICKUP LOCATION'),
                    icon: const Icon(Icons.fmd_good_outlined),
                    hintStyle:
                        GoogleFonts.poppins(color: Colors.grey, fontSize: 12.0),
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter Dropoff Location',
                    label: CustomTextWidget(text: 'DROP LOCATION'),
                    icon: const Icon(CupertinoIcons.location_north),
                    hintStyle:
                        GoogleFonts.poppins(color: Colors.grey, fontSize: 12.0),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15.0),
          Container(
            padding: const EdgeInsets.all(12.0),
            color: Colors.grey.shade200,
            child: TextFormField(
              onTap: () => _showBottomSheet(context),
              decoration: InputDecoration(
                hintText: 'Enter Dropoff Location',
                label: CustomTextWidget(text: 'DOCUMENT TYPE'),
                icon: const Icon(CupertinoIcons.doc_on_clipboard),
                suffixIcon: IconButton(
                    onPressed: () {
                      _showBottomSheet(context);
                    },
                    icon: const Icon(Icons.arrow_drop_down)),
                hintStyle:
                    GoogleFonts.poppins(color: Colors.grey, fontSize: 12.0),
              ),
            ),
          ),
          const SizedBox(height: 15.0),
          Container(
            padding: const EdgeInsets.all(12.0),
            color: Colors.grey.shade200,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Any Specific Instructions?',
                icon: const Icon(Icons.edit_note),
                hintStyle:
                    GoogleFonts.poppins(color: Colors.grey, fontSize: 14.0),
              ),
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(12.0),
            color: Colors.grey.shade200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(text: 'PAYMENT INFO'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextWidget(
                      text: 'SUB TOTAL',
                      fontWeight: FontWeight.w500,
                    ),
                    CustomTextWidget(text: '\$10.00'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextWidget(
                      text: 'SERVICE FEE',
                      fontWeight: FontWeight.w500,
                    ),
                    CustomTextWidget(text: '\$2.00'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextWidget(
                      text: 'AMOUNT TO PAY',
                      fontWeight: FontWeight.w700,
                    ),
                    CustomTextWidget(text: '\$12.00'),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomButton(
        buttonText: 'Continue',
        onTap: () {},
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          children: [
            ListTile(
              title: CustomTextWidget(
                text: 'Select Document Types',
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
              trailing: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: documentTypes.length,
                itemBuilder: (BuildContext context, int index) {
                  String type = documentTypes[index];
                  return SizedBox(
                    width: double.infinity,
                    child: ListTile(
                      title: CustomTextWidget(
                        text: type,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w300,
                      ),
                      trailing: Checkbox(
                        value: selectedTypes.contains(type),
                        onChanged: (value) {
                          setState(() {
                            if (value != null) {
                              selectedTypes.add(type);
                            } else {
                              selectedTypes.remove(type);
                            }
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle selected types
                print(selectedTypes);
                Navigator.of(context).pop();
              },
              child: const Text('Apply'),
            ),
          ],
        );
      },
    );
  }
}
