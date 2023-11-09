import 'package:flutter/material.dart';
import 'package:mad1_expensestracker_3c/components/expenses_entry.dart';
import 'package:mad1_expensestracker_3c/components/expenses_list_view.dart';
import 'package:mad1_expensestracker_3c/models/expenses_item.dart';

class ExpensesListScreen extends StatefulWidget {
  ExpensesListScreen({super.key});

  @override
  State<ExpensesListScreen> createState() => _ExpensesListScreenState();
}

class _ExpensesListScreenState extends State<ExpensesListScreen> {
  List<ExpensesItem> _expensesList = [
    ExpensesItem(description: 'rental', amount: 5000, date: DateTime.now()),
    ExpensesItem(description: 'travel', amount: 2000, date: DateTime.now()),
  ];

  void addExpensesItem(ExpensesItem expense) {
    _expensesList.add(expense);
    setState(() {});
  }

  void showItemsEntry() {
    showModalBottomSheet(
      context: context,
      builder: (_) => ExpensesEntry(
        addItem: addExpensesItem,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Expenses'),
        actions: [
          IconButton(
            onPressed: showItemsEntry,
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ExpensesListView(
              expensesList: _expensesList,
            ),
          ),
        ],
      ),
    );
  }
}
