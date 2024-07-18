import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense_tracker/data/models/expense_model.dart';
import 'package:personal_expense_tracker/data/repositories/expense_repository.dart';
import 'package:personal_expense_tracker/domain/entities/expense_entities.dart';
import 'package:personal_expense_tracker/domain/repositories/expense_repository.dart';
import 'package:personal_expense_tracker/domain/usecases/add_expense_usecases.dart';
import 'package:personal_expense_tracker/domain/usecases/get_all_expenses_usecases.dart';
import 'package:personal_expense_tracker/presentation/notifications.dart';

class HomeController extends GetxController {
  final ExpenseRepository _expenseRepository = HiveExpenseRepository();

  var expenses = <Expense>[].obs;
  var expense = Rxn<Expense>();
  final RxBool loading = RxBool(false);
  int total = 0;
  String totalAmount = '';

  @override
  void onInit() {
    total = 0;
    getAllExpense();
    LocalNotifications.showPeriodicNotifications(
      title: "Add your daily expense",
      body: "You have missed to add your daily expense.",
      payload: "This is a simple data",
    );
    update();
    super.onInit();
  }

  void getAllExpense() async {
    try {
      loading(true);
      expenses.value = await _expenseRepository.getAllExpense();

      for (var i = 0; i < expenses.length; i++) {
        total = int.parse(expenses[i].amount) + total;
      }

      totalAmount = total.toString();
      update();
    } catch (e) {
      print(e);
    } finally {
      loading(false);
    }
  }

  

  void addExpense(String title, String description, String amount) async {
    final newExpense = Expense(
      title: title,
      description: description,
      amount: amount,
    );
    await _expenseRepository.saveExpense(newExpense);
    onInit();
  }

  void updateExpense(
      dynamic index, String title, String description, String amount) async {
    final newExpense = Expense(
      title: title,
      description: description,
      amount: amount,
    );

    await _expenseRepository.updateExpense(index, newExpense);
    onInit();
  }

  void deleteExpense(dynamic index) async {
    await _expenseRepository.deleteExpense(index);
    onInit();
  }
}
