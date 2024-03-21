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


class TransactionController extends GetxController {
  final Rx<Transactions> _transactions = Rx(Transactions(title: "", dis: "", amound: '', type: '', catg: '',));

  Transactions get transactions => _transactions.value;

  void updateTitle(String name) {
    _transactions.value = Transactions(title: name, dis: transactions.dis, amound: transactions.amound,type: transactions.type , catg: transactions.catg); // Update only name
  }

  void updateDis(String dis) {
    _transactions.value = Transactions(title: transactions.title, dis: dis, amound: transactions.amound,type: transactions.type , catg: transactions.catg); // Update only currency
  }
}


class TransactionsController extends GetxController {
  final RxList<Transactions> _transactions = RxList<Transactions>([]);

  List<Transactions> get transactions => _transactions;

  void addTransaction(Transactions transaction) {
    _transactions.add(transaction);
  }

  void updateTransaction(int index, Transactions updatedTransaction) {
    _transactions[index] = updatedTransaction;
  }

  void deleteTransaction(int index) {
    _transactions.removeAt(index);
  }
}
