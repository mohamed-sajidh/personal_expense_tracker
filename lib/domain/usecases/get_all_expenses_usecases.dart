import 'package:personal_expense_tracker/domain/entities/expense_entities.dart';
import 'package:personal_expense_tracker/domain/repositories/expense_repository.dart';

class GetAllExpensesUsecases {
  late final ExpenseRepository expenseRepository;

  GetAllExpensesUsecases(this.expenseRepository);

  Future<List<Expense>> call() async {
    return await expenseRepository.getAllExpense();
  }
}
