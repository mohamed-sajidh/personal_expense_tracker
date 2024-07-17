import 'package:personal_expense_tracker/domain/entities/expense_entities.dart';

abstract class ExpenseRepository {
  Future<void> saveExpense(Expense expense);
  Future<List<Expense>> getAllExpense();
}
