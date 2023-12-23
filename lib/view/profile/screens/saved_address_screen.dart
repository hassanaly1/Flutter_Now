import 'package:flutter/material.dart';
import 'package:now/helper/utils/colors.dart';
import 'package:now/helper/widgets/custom_appbar_widget.dart';
import 'package:now/helper/widgets/custom_text_widget.dart';
import 'package:now/view/profile/widgets/change_account_name_dialog.dart';

class AddressModel {
  final String type;
  late final String address;
  final IconData icon;

  AddressModel({required this.type, required this.address, required this.icon});
}

class SavedAddressScreen extends StatefulWidget {
  const SavedAddressScreen({Key? key}) : super(key: key);

  @override
  _SavedAddressScreenState createState() => _SavedAddressScreenState();
}

class _SavedAddressScreenState extends State<SavedAddressScreen> {
  final List<AddressModel> addresses = [
    AddressModel(
        type: 'Home', address: '2962 Grant View Drive', icon: Icons.home),
    AddressModel(type: 'Work', address: '123 Main Street', icon: Icons.work),
    AddressModel(
        type: 'Other', address: '789 Elm Avenue', icon: Icons.location_on),
    AddressModel(type: 'Friend', address: '456 Oak Street', icon: Icons.person),
  ];

  void _editAddress(AddressModel address) {
    TextEditingController controller =
        TextEditingController(text: address.address);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: CustomTextWidget(
          text: 'Edit Address',
          fontWeight: FontWeight.w500,
          fontSize: 14.0,
        ),
        content: SettingsTextField(
            controller: controller, hintText: 'Enter new address'),
        actions: [
          TextButton(
            child: CustomTextWidget(
              text: 'Save',
              textColor: AppColors.primaryColor,
            ),
            onPressed: () {
              // Implement save logic here
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
      ),
    );
  }

  void _deleteAddress(int index) {
    setState(() {
      addresses.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarWidget(title: 'Saved Addresses'),
      body: ListView.builder(
        itemCount: addresses.length,
        itemBuilder: (context, index) {
          AddressModel address = addresses[index];
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Card(
              child: ListTile(
                iconColor: AppColors.primaryColor,
                tileColor: AppColors.primaryColor.withOpacity(0.1),
                leading: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300, shape: BoxShape.circle),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      address.icon,
                    ),
                  ),
                ),
                title: CustomTextWidget(
                  text: address.type,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
                subtitle: CustomTextWidget(
                  text: address.address,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  maxLines: 3,
                ),
                trailing: Wrap(
                  spacing: 12.0,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit_note),
                      onPressed: () => _editAddress(address),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_outline, color: Colors.red),
                      onPressed: () => _deleteAddress(index),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        highlightElevation: 5.0,
        elevation: 30.0,
        onPressed: _addNewAddress,
        backgroundColor: AppColors.primaryColor,
        child: const Icon(
          Icons.add_location_alt_sharp,
          color: Colors.white,
        ),
      ),
    );
  }

  void _addNewAddress() {
    TextEditingController typeController = TextEditingController();
    TextEditingController addressController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: CustomTextWidget(
          text: 'Add New Address',
          fontWeight: FontWeight.w500,
          fontSize: 14.0,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SettingsTextField(
              controller: typeController,
              hintText: 'Type (e.g., Home, Work)',
            ),
            SettingsTextField(
              controller: addressController,
              hintText: 'Address',
            ),
          ],
        ),
        actions: [
          TextButton(
            child: CustomTextWidget(
              text: 'Add',
              textColor: AppColors.primaryColor,
            ),
            onPressed: () {
              // Validate and save the new address
              String type = typeController.text.trim();
              String address = addressController.text.trim();

              if (type.isNotEmpty && address.isNotEmpty) {
                // Create a new AddressModel and add it to the list
                AddressModel newAddress = AddressModel(
                    type: type, address: address, icon: Icons.location_on);
                setState(() {
                  addresses.add(newAddress);
                });
                Navigator.of(context).pop(); // Close the dialog
              }
            },
          ),
          TextButton(
            child: CustomTextWidget(
              text: 'Cancel',
            ),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
        ],
      ),
    );
  }
}
