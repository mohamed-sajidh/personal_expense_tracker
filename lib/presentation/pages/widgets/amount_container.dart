import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_expense_tracker/presentation/colors.dart';
import 'package:personal_expense_tracker/presentation/controllers/home_controller.dart';
import 'package:personal_expense_tracker/presentation/pages/widgets/showEditPopup.dart';

class AmountContainer extends StatelessWidget {
  const AmountContainer({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    var screeenSize = MediaQuery.of(context).size;
    var width = screeenSize.width;
    var height = screeenSize.height;
    return IntrinsicWidth(
      child: IntrinsicHeight(
        child: Container(
          // height: height * 0.20,
          decoration: BoxDecoration(
            color: AppColors.amount_container_color,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 2, bottom: 2),
                    decoration: BoxDecoration(
                      color: AppColors.category_container_color,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(maxWidth: 300),
                    child: Text(
                      controller.expenses[index].title,
                      style: const TextStyle(color: AppColors.white),
                      softWrap: true,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.015,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 2, bottom: 2),
                    constraints: const BoxConstraints(maxWidth: 300),
                    child: Text(
                      controller.expenses[index].description,
                      style: const TextStyle(
                        color: AppColors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                      softWrap: true,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showEditPopup(
                        context,
                        index,
                      );
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: AppColors.edit_color,
                      size: 25.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.015,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 2, bottom: 2),
                    constraints: const BoxConstraints(maxWidth: 300),
                    child: Text(
                      "${controller.expenses[index].amount}.00 INR",
                      style: const TextStyle(
                        color: AppColors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                      softWrap: true,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Get.back();
                      print("button pressed");
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: AppColors.delete_color,
                      size: 25.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
