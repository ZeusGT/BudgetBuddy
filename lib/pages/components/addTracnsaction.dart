import 'package:budgetbuddy/pages/InfoPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data_model.dart';
import '../../data_user.dart';

class AddTransactionPopup extends StatefulWidget {
  //final Function(String title, double value, String description, String category, bool isIncome) onSubmit;

  const AddTransactionPopup({Key? key}) : super(key: key);

  @override
  _AddTransactionPopupState createState() => _AddTransactionPopupState();
}

class _AddTransactionPopupState extends State<AddTransactionPopup> {
  final TransactionsController transactionController2 = Get.put(TransactionsController());
  late Transactions tData;
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  final _descriptionController = TextEditingController();
  String _selectedCategory = 'food';
  bool _isIncome = true; // Default to income

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Add Transaction'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final title = _titleController.text;
                final value = double.tryParse(_valueController.text) ?? 0.0;
                final description = _descriptionController.text;
                Transactions data = Transactions(title: title, dis: description, amound: value as String, type: _isIncome as String, catg: _selectedCategory);
                transactionController2.addTransaction(data);
                print(transactionController2.transactions[0].title);
                //widget.onSubmit(title, value, description, _selectedCategory, _isIncome);
                Navigator.pop(context); // Close the dialog after submit
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
      child: Text('Add'),
    );
  }
}
