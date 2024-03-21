import 'package:budgetbuddy/pages/InfoPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data_model.dart';
import '../../data_user.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({Key? key}) : super(key: key);

  @override
  _AddTransactionPageState createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  final TransactionsController transactionController2 = Get.put(TransactionsController());
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  final _descriptionController = TextEditingController();
  String _selectedCategory = 'food';
  bool _isIncome = true; // Default to income

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Transaction'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: _valueController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Value'),
              ),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
              Row(
                children: [
                  Text('Category: ', style: TextStyle(fontWeight: FontWeight.bold)),
                  DropdownButton<String>(
                    value: _selectedCategory,
                    items: [
                      DropdownMenuItem(value: 'food', child: Text('Food')),
                      DropdownMenuItem(value: 'health', child: Text('Health')),
                      DropdownMenuItem(value: 'education', child: Text('Education')),
                    ],
                    onChanged: (value) => setState(() => _selectedCategory = value!),
                  ),
                ],
              ),
              Row(
                children: [
                  Text('Type: ', style: TextStyle(fontWeight: FontWeight.bold)),
                  Radio(
                    value: true,
                    groupValue: _isIncome,
                    onChanged: (value) => setState(() => _isIncome = value as bool),
                  ),
                  Text('Income'),
                  Radio(
                    value: false,
                    groupValue: _isIncome,
                    onChanged: (value) => setState(() => _isIncome = value as bool),
                  ),
                  Text('Expense'),
                ],
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  final title = _titleController.text;
                  final value = double.tryParse(_valueController.text) ?? 0.0;
                  final description = _descriptionController.text;
                  final transaction = Transactions(
                      title: title,
                      dis: description,
                      amound: value.toString(),
                      type: _isIncome ? 'Income' : 'Expense',
                      catg: _selectedCategory);
                  transactionController2.addTransaction(transaction);
                  print(transaction.title);
                  Navigator.pop(context); // Close the page after submit
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
