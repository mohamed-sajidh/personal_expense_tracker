
import 'package:personal_expense_tracker/domain/entities/expense_entities.dart';
import 'package:personal_expense_tracker/domain/repositories/expense_repository.dart';

class AddExpenseUsecases {
  late final ExpenseRepository repository;
  AddExpenseUsecases(this.repository);

  Future<void> execute(Expense expense) async {
    await repository.saveExpense(expense);
  }
}