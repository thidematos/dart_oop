import 'package:dart_oop/classes/customer.dart';

class Transactions {
  Transactions(
      {required this.origin, required this.destination, required this.value});

  Customer origin;
  Customer destination;
  double value;
  DateTime time = DateTime.now();
}
