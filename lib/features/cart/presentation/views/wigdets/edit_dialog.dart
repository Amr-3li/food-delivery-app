import 'package:flutter/material.dart';

class EditAddressDialog {
  static void showEditAddressDialog(
    BuildContext context, {
    String? title,
    // AddressModel? existingAddress,
    required Function(String) onSave,
  }) {
    final titleController = TextEditingController(text: title ?? '');

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title == null ? 'Add Address' : 'Edit Address'),
          content: TextField(
            controller: titleController,
            decoration: InputDecoration(labelText: 'Title'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                onSave(titleController.text);
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
