import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_expense_tracker/presentation/asset.dart';
import 'package:personal_expense_tracker/presentation/colors.dart';
import 'package:personal_expense_tracker/presentation/controllers/home_controller.dart';
import 'package:personal_expense_tracker/presentation/pages/widgets/add_expense.dart';
import 'package:personal_expense_tracker/presentation/pages/widgets/amount_container.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    var screeenSize = MediaQuery.of(context).size;
    var width = screeenSize.width;
    var height = screeenSize.height;
    return Scaffold(
      appBar: AppBar(
        // title: const Center(
        //   child: Text(
        //     'Personal Expense Tracker',
        //     style: TextStyle(
        //       color: AppColors.black,
        //       fontWeight: FontWeight.w600,
        //     ),
        //   ),
        // ),

        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Personal Expense Tracker',
              style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            GetBuilder<HomeController>(
              builder: (homeController) {
                return Text(
                  '${homeController.totalAmount}.00',
                  style: const TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                  ),
                );
              }
            ),
          ],
        ),
      ),
      body: GetBuilder(
        init: HomeController(),
        builder: (controller) {
          return Obx(
            () {
              if (controller.expenses.isEmpty) {
                print("no data found");
                return const Center(
                  child: Image(
                    image: AssetImage(Asset.no_data_img),
                    fit: BoxFit.cover,
                  ),
                );
              }

              if (controller.loading.isTrue) {
                return const Center(child: CircularProgressIndicator());
              }

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                  itemBuilder: (context, index) =>
                      AmountContainer(index: index),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: controller.expenses.length,
                ),
              );
            },
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
