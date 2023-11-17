import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:mad1_expensestracker_3c/models/expenses_item.dart';

class ExpensesListView extends StatelessWidget {
  ExpensesListView(
      {super.key, required this.expensesList, required this.removeItem});

  List<ExpensesItem> expensesList;
  Function(ExpensesItem item) removeItem;

  @override
  Widget build(BuildContext context) {
    var date_format = DateFormat.yMd();
    var amount_format = NumberFormat.currency(symbol: '₱', decimalDigits: 2);
    return ListView.builder(
      itemCount: expensesList.length,
      itemBuilder: (_, index) => Dismissible(
        key: ValueKey(expensesList[index].id),
        background: Container(
          color: Colors.red,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 12),
          child: const Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
        // secondaryBackground: Container(
        //   color: Colors.blue,
        // ),
        onDismissed: (direction) {
          print(direction);
          if (direction == DismissDirection.startToEnd) {
            //delete
          } else {
            //archive
          }
          //remove
          removeItem(expensesList[index]);
        },
        direction: DismissDirection.endToStart,
        child: Card(
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
      ),
    );
  }
}
