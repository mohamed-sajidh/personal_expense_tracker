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
  final Box<ExpenseModel> _expenseBox = Hive.box<ExpenseModel>('expense');

  var expenses = <Expense>[].obs;
  var expense = Rxn<Expense>();
  final RxBool loading = RxBool(false);

  @override
  void onInit() {
    getAllExpense();
    LocalNotifications.showPeriodicNotifications(
      title: "Add your daily expense",
      body: "Add your daily expense",
      payload: "This is a simple data",
    );
    super.onInit();
  }

  void getAllExpense() async {
    try {
      loading(true);
      expenses.value = await _expenseRepository.getAllExpense();
      print(expenses.value);
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
    getAllExpense();
  }

  void addExpenseWithDate(
      String title, String description, String amount) async {
    final newExpense = Expense(
      title: title,
      description: description,
      amount: amount,
    );

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    print('Formatted Date: $formattedDate');

    // await _expenseBox.add(newExpense);
  }

  void updateExpense(
      dynamic index, String title, String description, String amount) async {
    final newExpense = Expense(
      title: title,
      description: description,
      amount: amount,
    );

    await _expenseRepository.updateExpense(index, newExpense);
    getAllExpense();
  }

  void deleteExpense(dynamic index) async {
    await _expenseRepository.deleteExpense(index);
    getAllExpense();
  }
}
