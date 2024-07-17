import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hive/hive.dart';
import 'package:personal_expense_tracker/data/models/expense_model.dart';
import 'package:personal_expense_tracker/data/repositories/expense_repository.dart';
import 'package:personal_expense_tracker/domain/entities/expense_entities.dart';
import 'package:personal_expense_tracker/domain/repositories/expense_repository.dart';
import 'package:personal_expense_tracker/domain/usecases/add_expense_usecases.dart';
import 'package:personal_expense_tracker/domain/usecases/get_all_expenses_usecases.dart';

class HomeController extends GetxController {
  final ExpenseRepository _expenseRepository = HiveExpenseRepository();

  var expenses = <Expense>[].obs;
  var expense = Rxn<Expense>();
  final RxBool loading = RxBool(false);

  @override
  void onInit() {
    getAllExpense();
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

  void updateExpense(dynamic index, String title, String description, String amount) async {
    final newExpense = Expense(
      title: title,
      description: description,
      amount: amount,
    );

    await _expenseRepository.updateExpense(index, newExpense);
    getAllExpense();
  }
}
