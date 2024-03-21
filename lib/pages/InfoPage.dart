import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:budgetbuddy/data_user.dart';
import 'package:fl_chart/fl_chart.dart'; // Import for charts

class InfoPage extends StatelessWidget {
  // Sample transaction data (replace with actual data fetching logic)
  final List<Transaction> transactions = [
    Transaction(
        date: DateTime(2024, 03, 20),
        type: 'Expense',
        amount: 50.00,
        category: 'Groceries'),
    Transaction(
        date: DateTime(2024, 03, 18),
        type: 'Income',
        amount: 100.00,
        category: 'Salary'),
    Transaction(
        date: DateTime(2024, 03, 15),
        type: 'Expense',
        amount: 25.00,
        category: 'Bills'),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Transaction Summary Chart (replace with desired chart)
            AspectRatio(
              aspectRatio: 1.6,
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(
                      color: Colors.green,
                      value: calculateIncome(transactions),
                      title: 'Income',
                      radius: 60,
                      //value: '${calculateIncome(transactions).toStringAsFixed(2)}',
                    ),
                    PieChartSectionData(
                      color: Colors.red,
                      value: calculateExpense(transactions),
                      title: 'Expense',
                      radius: 60,
                      //label: '${calculateExpense(transactions).toStringAsFixed(2)}',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),

            // Transaction List
            Text(
              'Recent Transactions',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            ListView.builder(
              shrinkWrap: true, // Prevent unnecessary scrolling
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return TransactionItem(transaction: transactions[index]);
              },
            ),
          ],
        ),
      ),
    );
  }

  // Function to calculate total income
  double calculateIncome(List<Transaction> transactions) {
    return transactions.fold(
        0.0,
        (sum, transaction) =>
            sum + (transaction.type == 'Income' ? transaction.amount : 0.0));
  }

  // Function to calculate total expense
  double calculateExpense(List<Transaction> transactions) {
    return transactions.fold(
        0.0,
        (sum, transaction) =>
            sum + (transaction.type == 'Expense' ? transaction.amount : 0.0));
  }
}

// Transaction class
class Transaction {
  final DateTime date;
  final String type;
  final double amount;
  final String category;

  Transaction(
      {required this.date,
      required this.type,
      required this.amount,
      required this.category});
}

// Transaction item widget
class TransactionItem extends StatelessWidget {
  final Transaction transaction;

  TransactionItem({required this.transaction});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(transaction.type == 'Income'
          ? Icons.arrow_upward
          : Icons.arrow_downward),
      title: Text(transaction.category),
      subtitle: Text(
          '${transaction.date.day}/${transaction.date.month}/${transaction.date.year} - ${transaction.amount.toStringAsFixed(2)}'),
    );
  }
}
