import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:personal_expense_tracker/presentation/controllers/home_controller.dart';

void showDeletePopup(BuildContext context, index) {
  final HomeController controller = Get.put(HomeController());

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are you sure you want to delete'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Get.back(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                controller.deleteExpense(index);
                Get.back();
              },
              child: const Text('OK'),
            ),
          ],
        );
      });
}
