import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:personal_expense_tracker/data/repositories/expense_repository.dart';
import 'package:personal_expense_tracker/domain/entities/expense_entities.dart';
import 'package:personal_expense_tracker/domain/repositories/expense_repository.dart';

class HomeController extends GetxController {
  final ExpenseRepository _expenseRepository = HiveExpenseRepository();

  void addExpense(String title, String description, String amount) async {
    final newExpense = Expense(
      id: 0,
      title: title,
      description: description,
      amount: amount,
    );
    await _expenseRepository.saveExpense(newExpense);
  }
}
