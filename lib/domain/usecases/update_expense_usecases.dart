import 'package:personal_expense_tracker/domain/entities/expense_entities.dart';
import 'package:personal_expense_tracker/domain/repositories/expense_repository.dart';

class UpdateExpenseUsecases {
  late final ExpenseRepository repository;

  UpdateExpenseUsecases(this.repository);

  Future<void> execute(dynamic index, Expense expense) async {
    await repository.updateExpense(index, expense);
  }
}
