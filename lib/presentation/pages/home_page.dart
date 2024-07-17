import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_expense_tracker/presentation/colors.dart';
import 'package:personal_expense_tracker/presentation/controllers/home_controller.dart';
import 'package:personal_expense_tracker/presentation/pages/widgets/add_expense.dart';
import 'package:personal_expense_tracker/presentation/pages/widgets/amount_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var screeenSize = MediaQuery.of(context).size;
    var width = screeenSize.width;
    var height = screeenSize.height;
    return Scaffold(
      body: GetBuilder(
        init: HomeController(),
        builder: (controller) {
          return Obx(
            () => controller.loading.isTrue
                ? CircularProgressIndicator()
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.separated(
                      itemBuilder: (context, index) => AmountContainer(index: index),
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: controller.expenses.length,
                    ),
                  ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddExpenseBottomSheet(context);
        },
        backgroundColor: AppColors.category_container_color,
        foregroundColor: AppColors.white,
        elevation: 2.0,
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                // Handle tap on first item
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                // Handle tap on second item
              },
            ),
          ],
        ),
      ),
    );
  }
}
