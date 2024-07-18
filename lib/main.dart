import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/instance_manager.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:personal_expense_tracker/data/models/expense_model.dart';
import 'package:personal_expense_tracker/data/repositories/expense_repository.dart';
import 'package:personal_expense_tracker/domain/usecases/add_expense_usecases.dart';
import 'package:personal_expense_tracker/domain/usecases/delete_expense_usecases.dart';
import 'package:personal_expense_tracker/domain/usecases/get_all_expenses_usecases.dart';
import 'package:personal_expense_tracker/domain/usecases/update_expense_usecases.dart';
import 'package:personal_expense_tracker/presentation/controllers/home_controller.dart';
import 'package:personal_expense_tracker/presentation/notifications.dart';
import 'package:personal_expense_tracker/presentation/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotifications.init();
  await Hive.initFlutter();

  Hive.registerAdapter(ExpenseModelAdapter());
  print("Opening Hive box...");

  await Hive.openBox<ExpenseModel>('expense');
  print("Hive box opened successfully.");

  print("Setting up dependencies...");

  try {
    Get.put(HomeController());
    final userRepository = HiveExpenseRepository();
    Get.put(AddExpenseUsecases(userRepository));
    Get.put(GetAllExpensesUsecases(userRepository));
    Get.put(UpdateExpenseUsecases(userRepository));
    Get.put(DeleteExpenseUsecases(userRepository));
    print("Dependencies set up successfully.");
  } catch (e) {
    print("Error setting up dependencies: $e");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Personal Expense Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}


