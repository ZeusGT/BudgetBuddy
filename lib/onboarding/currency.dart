import 'package:budgetbuddy/data_model.dart';
import 'package:budgetbuddy/data_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../pages/HomePage.dart';




class CurrencyPage extends StatelessWidget {
    final UserController userController = Get.find(); 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bugget Buddy"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Select the currency"),
            Row(
              children: [
                Card(
                  child: ElevatedButton(
                    onPressed: (){
        
                      userController.updateCurrency("\u{20B9}");

                    },
                    child: const SizedBox(
                      height: 100,
                      width: 100,
                      child: Column(
                        children: [
                          Text("Indian Rupee")
                        ],
                        
                      ),
                    ),
                  ),
                ),
                Card(
                  child: ElevatedButton(
                    onPressed: (){
                      userController.updateCurrency("\$");
                    },
                    child: const SizedBox(
                      height: 100,
                      width: 100,
                      child: Column(
                        children: [
                          Text("US Dollar")
                        ],
                        
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(onPressed: (){
                    print("get name is ${userController.user.name}");
                    print("get name is ${userController.user.currency}");
                    Get.to(HomePage());
                  }, child: const Text("Next")),
          ],

        ),

      )
    );
  }
}