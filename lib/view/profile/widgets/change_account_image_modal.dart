import 'package:flutter/material.dart';
import 'package:now/helper/widgets/custom_text_widget.dart';

class ChangeAccountImageModal extends StatelessWidget {
  const ChangeAccountImageModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: CustomTextWidget(
                  text: 'Change Account Image',
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0,
                ),
              ),
              const Divider(
                color: Colors.black54,
                thickness: 2,
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: CustomTextWidget(
                  text: 'Take Picture',
                  fontWeight: FontWeight.w400,
                  fontSize: 14.0,
                ),
                onTap: () {
                  // Handle the "Take Picture" option
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: CustomTextWidget(
                  text: 'Import from Gallery',
                  fontWeight: FontWeight.w400,
                  fontSize: 14.0,
                ),
                onTap: () {
                  // Handle the "Import from Gallery" option
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
