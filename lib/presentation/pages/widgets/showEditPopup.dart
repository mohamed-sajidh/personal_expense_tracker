import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:personal_expense_tracker/data/models/expense_model.dart';
import 'package:personal_expense_tracker/presentation/controllers/home_controller.dart';

void showEditPopup(BuildContext context, index) {
  final HomeController controller = Get.put(HomeController());
  final TextEditingController titleController =
      TextEditingController(text: controller.expenses[index].title);
  final TextEditingController descriptionController =
      TextEditingController(text: controller.expenses[index].description);
  final TextEditingController amountController =
      TextEditingController(text: controller.expenses[index].amount);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Edit Data'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'title',
              ),
            ),
            // TextField for phone with existing value
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: 'description',
              ),
            ),
            TextField(
              controller: amountController,
              decoration: const InputDecoration(
                labelText: 'amount',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              controller.updateExpense(
                index,
                titleController.text,
                descriptionController.text,
                amountController.text,
              );
              Get.back();
            },
            child: const Text('Save'),
          ),
        ],
      );
    },
  );
}
