import 'dart:io';

import 'package:myapp/bank_account.dart';
import 'package:myapp/is_empty_exception.dart';

import 'insufficient_balance_exception.dart';

int calculate() {
  return 6 * 7;
}

BankAccount creatAccount() {
  String? myName;
  while (true) {
    print("Please enter your name to create your bank acount: ");
    try {
      myName = stdin.readLineSync(); // using readLineSync() to take input
      if (myName == null || myName.isEmpty) {
        throw IsEmptyException();
      }
      BankAccount bankAccount = BankAccount(myName);
      return bankAccount;
    } catch (e) {
      print(e.toString());
    }
  }
}

void bank(BankAccount bankAccount) {
  String userChoise = '';
  double amount;
  while (userChoise != 'c') {
    print(
        "Please type one of the following commands\n 'D' for deposite, 'W' for  withdraw, 'B' to review your balance,\n 'S' to show all your transactions, 'SW' to show your Withdrawels, 'SD' to show your Deposits and 'C' to cancel:");
    userChoise = stdin.readLineSync() ?? '';
    userChoise = userChoise.toLowerCase();
    if (userChoise == 'd') {
      try {
        print("Enter the amount you want to deposite:");
        amount = double.parse(stdin.readLineSync() ?? '');
        bankAccount.deposit(amount);
        print("Your new balance is ${bankAccount.balance}.\n");
      } catch (e) {
        print("Please enter a valid number.\n");
      }
    } else if (userChoise == 'w') {
      try {
        print("Enter the amount you want to withdraw:");
        amount = double.parse(stdin.readLineSync() ?? '');
        bankAccount.withdraw(amount);
        print("Your new balance is ${bankAccount.balance}.\n");
      } on InsufficientBalanceException catch (e) {
        print(e.toString());
        print("\n");
      } on FormatException catch (e) {
        print(e.toString());
        print("\n");
      }
    } else if (userChoise == 'b') {
      print("Your current balance is ${bankAccount.balance}\$\n");
    } else if (userChoise == 's') {
      bankAccount.showAllLogs();
      print("\n");
    } else if (userChoise == 'sw') {
      bankAccount.showWithdraw();
      print("\n");
    } else if (userChoise == 'sd') {
      bankAccount.showDeposit();
      print("\n");
    } else if (userChoise == 'c') {
      print("Good Bye!");
    } else {
      print("The value $userChoise is invalid input.\n");
    }
  }
}
