import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_expense_tracker/presentation/colors.dart';
import 'package:personal_expense_tracker/presentation/controllers/home_controller.dart';

void showAddExpenseBottomSheet(BuildContext context) {
  final anFormKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      final HomeController controller = Get.put(HomeController());
      var screeenSize = MediaQuery.of(context).size;
      var width = screeenSize.width;
      var height = screeenSize.height;
      return IntrinsicHeight(
        child: Container(
          width: width,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: anFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.close,
                        color: AppColors.black,
                        size: 25.0,
                      ),
                    ),
                  ),
                  const DefaultTextStyle(
                    style: TextStyle(
                      color: AppColors.category_container_color,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    child: Text("Please Enter the Expense"),
                  ),
                  SizedBox(
                    height: height * 0.010,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: TextFormField(
                      controller: titleController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'required';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: AppColors.textfieldColor,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.category_container_color,
                            width: 0.5,
                          ),
                        ),
                        labelText: 'Title',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.010,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: TextFormField(
                      controller: descriptionController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'required';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: AppColors.textfieldColor,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.category_container_color,
                            width: 0.5,
                          ),
                        ),
                        labelText: 'Description',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.010,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: TextFormField(
                      controller: amountController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'required';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: AppColors.textfieldColor,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.category_container_color,
                            width: 0.5,
                          ),
                        ),
                        labelText: 'Amount',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.010,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        if (anFormKey.currentState!.validate()) {
                          controller.addExpense(
                            titleController.text,
                            descriptionController.text,
                            amountController.text,
                          );
                          Get.back();
                          titleController.clear();
                          descriptionController.clear();
                          amountController.clear();
                        }
                      },
                      child: Container(
                        height: height * 0.05,
                        width: width * 0.15,
                        decoration: BoxDecoration(
                          color: AppColors.category_container_color,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Center(
                          child: Text(
                            "Add",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              height: 1.2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
