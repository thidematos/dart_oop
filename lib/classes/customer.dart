import 'dart:math';

class Customer {
  Customer({required this.name});

  final String name;
  double balance = 0;
  final String id =
      '${Random().nextInt(100).toString().padLeft(3, '0')}.${Random().nextInt(100).toString().padLeft(3, '0')}.${Random().nextInt(100).toString().padLeft(3, '0')}';
}
