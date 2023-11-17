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

  void addExpensesItem(ExpensesItem item) {
    setState(() {
      _expensesList.add(item);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('A new entry was added.'),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () => undoAddExpensesItem(item),
          ),
        ),
      );
    });
  }

  void undoAddExpensesItem(ExpensesItem item) {
    setState(() {
      _expensesList.remove(item);
    });
  }

  void removeExpensesItem(ExpensesItem item) {
    //get the index first
    var index = _expensesList.indexOf(item);
    setState(() {
      _expensesList.remove(item);
    });
    print('list count: ${_expensesList.length}');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Item removed'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () => undoRemoveExpenseItem(item, index),
        ),
      ),
    );
  }

  void undoRemoveExpenseItem(ExpensesItem item, int index) {
    setState(() {
      //_expensesList.add(item);
      _expensesList.insert(index, item);
    });
  }

  void showItemsEntry() {
    showModalBottomSheet(
      context: context,
      builder: (_) => ExpensesEntry(
        addItem: addExpensesItem,
      ),
      isScrollControlled: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
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
            child: _expensesList.isNotEmpty
                ? ExpensesListView(
                    expensesList: _expensesList,
                    removeItem: removeExpensesItem,
                  )
                : Center(
                    child: Opacity(
                      opacity: 0.3,
                      child: Image.asset(
                        'assets/images/empty_list.png',
                        width: width * .25,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
