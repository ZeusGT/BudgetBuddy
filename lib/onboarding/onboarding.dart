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

    // ignore: non_constant_identifier_names
    //late User data = User(name: "name", currency: "currency");
    TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Bugget Buddy"),
      ),
      body: Container(
        color: Colors.grey[400],
        child: Card(
          child: SizedBox(
            height: 300,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("What should we call you"),
                  TextField(
                    controller: controller,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(onPressed: (){
                    userController.updateName(controller.text);
                  Get.to(CurrencyPage());
                    //CurrencyPage
                  }, child: const Text("Next")),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}