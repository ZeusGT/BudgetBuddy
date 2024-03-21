import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:budgetbuddy/data_user.dart';

import 'AddTransaction.dart';
import 'DebitPage.dart';
import 'InfoPage.dart';
import 'components/addTracnsaction.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Keeps track of selected navbar item

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: _selectedIndex == 0 ? HomePage1() : _selectedIndex == 1 ? DebitPage() : InfoPage(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: 'Debit',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}


class HomePage1 extends StatefulWidget {
  @override
  _HomePageState1 createState() => _HomePageState1();
}

class _HomePageState1 extends State<HomePage1> {
  // Sample data (replace with actual data fetching logic)
  double balance = 1000.00;
  double totalReceived = 500.00;
  double totalSpent = 200.00;

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.put(UserController());
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Welcome message
            Text(
              'Welcome ${userController.user.name}!',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),

            // Balance card
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Balance',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${userController.user.currency} ${balance.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Divider(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total Received'),
                        Text('${userController.user.currency} ${totalReceived.toStringAsFixed(2)}'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total Spent'),
                        Text(
                          '${userController.user.currency} ${totalSpent.toStringAsFixed(2)}',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),

            // Daily and Monthly buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle Daily button press (navigate or show data)
                  },
                  child: Text('Daily'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle Monthly button press (navigate or show data)
                  },
                  child: Text('Monthly'),
                ),
              ],
            ),

            SizedBox(height: 20.0),

            //Add button
            ElevatedButton.icon(
              onPressed: () {
                Get.to(AddTransactionPage());
              },
              icon: Icon(Icons.add),
              label: Text('Add'),
            ),
            //const AddTransactionPopup()
          ],
        ),
      ),
    );
  }
}

