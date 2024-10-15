import 'package:myapp/insufficient_balance_exception.dart';

class BankAccount {
  String ownerName;
  double balance = 0.0;
  Map<String, double> transactions = {};

  BankAccount(this.ownerName);

  void withdraw(double amount) {
    if (amount > balance) {
      throw InsufficientBalanceException(
          "The amount you want to withdraw is greater than your balance.");
    }
    balance -= amount;
    transactions['Withdraw at ${DateTime.now()}'] = amount;
  }

  void deposit(double amount) {
    balance += amount;
    transactions['Deposit at ${DateTime.now()}'] = amount;
  }

  void showWithdraw() {
    if (transactions.isEmpty) {
      print("No transactions to show");
      return;
    }
    transactions.forEach((key, value) {
      int count = 0;
      if (key[0] == "W") {
        print('$key, \$$value');
        count++;
      }
      if (count == 0) {
        print("No transactions to show");
      }
    });
  }

  void showDeposit() {
    if (transactions.isEmpty) {
      print("No transactions to show");
      return;
    }
    transactions.forEach((key, value) {
      int count = 0;
      if (key[0] == "D") {
        print('$key, \$$value');
        count++;
      }
      if (count == 0) {
        print("No transactions to show");
      }
    });
  }

  void showAllLogs() {
    if (transactions.isEmpty) {
      print("No transactions to show");
      return;
    }
    transactions.forEach((key, value) {
      print('$key, \$$value');
    });
  }
}
