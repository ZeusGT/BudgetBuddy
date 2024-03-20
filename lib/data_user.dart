import 'package:get/get.dart';
import 'package:budgetbuddy/data_model.dart';

class UserController extends GetxController {
  final Rx<User> _user = Rx(User(name: "", currency: ""));

  User get user => _user.value;

  void updateName(String name) {
    _user.value = User(name: name, currency: user.currency); // Update only name
  }

  void updateCurrency(String currency) {
    _user.value = User(name: user.name, currency: currency); // Update only currency
  }
}
