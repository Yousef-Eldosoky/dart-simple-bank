import 'package:myapp/bank_account.dart';
import 'package:myapp/myapp.dart' as myapp;

void main(List<String> arguments) {
  BankAccount bankAccount = myapp.creatAccount();
  print(
      "Hey ${bankAccount.ownerName}, \n Welcome To your bank acount"); // printing line
  print("\n\n");
  myapp.bank(bankAccount);
}
