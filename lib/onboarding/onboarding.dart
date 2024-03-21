import 'package:budgetbuddy/data_model.dart';
import 'package:budgetbuddy/data_user.dart';
import 'package:budgetbuddy/onboarding/currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class OnBoardingPage extends StatelessWidget {
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Bugget Buddy"),
      ),
      body: Container(
        color: Colors.grey[400],
        child: Center( // Center the Card within the container
          child: Card(
            child: SizedBox(
              height: 300, // Set a fixed height for the Card
              child: Padding(
                padding: const EdgeInsets.all(16.0), // Adjust padding as needed
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("What should we call you"),
                    TextField(
                      controller: controller,
                      minLines: 1,
                      //constraints: BoxConstraints(maxHeight: 50.0), // Set max height for TextField
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        userController.updateName(controller.text);
                        Get.to(CurrencyPage());
                      },
                      child: const Text("Next"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
