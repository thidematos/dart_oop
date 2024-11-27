import 'package:dart_oop/caixa.dart';
import 'package:dart_oop/classes/customer.dart';
import 'package:dart_oop/classes/transactions.dart';

class CaixaOperational {
  Customer currentSection;
  List<Customer> allCustomers = customers;

  CaixaOperational(this.currentSection);

  bool withdraw(double value) {
    if (value <= currentSection.balance) {
      currentSection.balance -= value;
      currentSection.allTransactions
          .add(Transactions('Saque', origin: currentSection.id, value: value));
      return true;
    } else {
      return false;
    }
  }

  bool deposit(double value) {
    if (!(value > 0)) {
      return false;
    }

    currentSection.balance += value;
    currentSection.allTransactions
        .add(Transactions('Depósito', origin: currentSection.id, value: value));
    return true;
  }

  bool transfer(String id, double value) {
    print('id: $id');
    print('value: $value');
    final Customer destination =
        customers.firstWhere((customer) => customer.id == id);

    currentSection.balance -= value;
    destination.balance += value;

    final Transactions newTransaction = Transactions('Transferência',
        origin: currentSection.id, destination: destination.name, value: value);

    currentSection.allTransactions.add(newTransaction);
    destination.allTransactions.add(newTransaction);

    return true;
  }
}
