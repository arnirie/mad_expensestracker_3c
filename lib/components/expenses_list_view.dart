import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:mad1_expensestracker_3c/models/expenses_item.dart';

class ExpensesListView extends StatelessWidget {
  ExpensesListView({super.key, required this.expensesList});

  List<ExpensesItem> expensesList;

  @override
  Widget build(BuildContext context) {
    var date_format = DateFormat.yMd();
    var amount_format = NumberFormat.currency(symbol: '₱', decimalDigits: 2);
    return ListView.builder(
      itemCount: expensesList.length,
      itemBuilder: (_, index) => Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text('${expensesList[index].description}'),
              const Gap(20),
              Row(
                children: [
                  Text('${amount_format.format(expensesList[index].amount)}'),
                  const Spacer(),
                  Text('${date_format.format(expensesList[index].date)}'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
