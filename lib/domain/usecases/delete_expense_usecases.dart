import 'package:personal_expense_tracker/domain/repositories/expense_repository.dart';

class DeleteExpenseUsecases {
  late final ExpenseRepository repository;
  DeleteExpenseUsecases(this.repository);

  Future<void> execute(dynamic index) async {
    await repository.deleteExpense(index);
  }
}