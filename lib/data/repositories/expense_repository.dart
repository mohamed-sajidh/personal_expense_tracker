import 'package:hive_flutter/adapters.dart';
import 'package:personal_expense_tracker/data/models/expense_model.dart';
import 'package:personal_expense_tracker/domain/entities/expense_entities.dart';
import 'package:personal_expense_tracker/domain/repositories/expense_repository.dart';

class HiveExpenseRepository implements ExpenseRepository {
  final Box<ExpenseModel> _expenseBox = Hive.box<ExpenseModel>('expense');

  HiveExpenseRepository() {
    print("HiveUserRepository initialized.");
  }

  @override
  Future<void> saveExpense(Expense expense) async {
    final expenseModel = ExpenseModel(
      title: expense.title,
      description: expense.description,
      amount: expense.amount,
    );

    await _expenseBox.add(expenseModel);
  }

  @override
  Future<List<Expense>> getAllExpense() async {
    final expenses = _expenseBox.values.map((expenseModel) {
      return Expense(
        title: expenseModel.title,
        description: expenseModel.description,
        amount: expenseModel.amount,
      );
    }).toList();

    return expenses;
  }

  @override
  Future<void> updateExpense(dynamic index, Expense expense) async {
    final expenseModel = ExpenseModel(
      title: expense.title,
      description: expense.description,
      amount: expense.amount,
    );
    await _expenseBox.putAt(index, expenseModel);
  }
}
