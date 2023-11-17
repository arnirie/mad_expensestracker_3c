import 'package:flutter/material.dart';
import 'package:mad1_expensestracker_3c/screens/expenses_list.dart';

void main() {
  runApp(ExpensesTrackerApp());
}

class ExpensesTrackerApp extends StatelessWidget {
  ExpensesTrackerApp({super.key});

  final colorScheme = ColorScheme.fromSeed(seedColor: Color(0xFF001B79));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          // scaffoldBackgroundColor: Colors.red,
          colorScheme: colorScheme,
          appBarTheme: AppBarTheme(
            backgroundColor: colorScheme.onPrimaryContainer,
            foregroundColor: colorScheme.primaryContainer,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.onPrimaryContainer,
                foregroundColor: colorScheme.onPrimary),
          ),
          cardTheme: CardTheme(
            color: colorScheme.secondaryContainer,
            elevation: 4,
            margin: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
          ),
          textTheme: TextTheme(
            titleLarge: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 22,
              color: colorScheme.onSecondaryContainer,
            ),
          )),
      debugShowCheckedModeBanner: false,
      home: ExpensesListScreen(),
    );
  }
}
