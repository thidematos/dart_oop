import 'dart:math';

import 'package:dart_oop/classes/caixa_operational.dart';
import 'package:dart_oop/classes/transactions.dart';
import 'package:flutter/material.dart';

String generateRandom() {
  return Random().nextInt(100).toString().padLeft(3, '0');
}

class Customer {
  Customer({required this.name});

  void Function(Widget)? switchScreen;

  final List<Transactions> allTransactions = [];
  final String name;
  double balance = Random().nextInt(3500).toDouble();
  final String id =
      '${generateRandom()}.${generateRandom()}.${generateRandom()}';

  bool withdraw(double value) {
    CaixaOperational newCaixaSection = CaixaOperational(this);
    final bool status = newCaixaSection.withdraw(value);
    return status;
  }

  bool deposit(double value) {
    CaixaOperational newCaixaSection = CaixaOperational(this);
    final bool status = newCaixaSection.deposit(value);
    return status;
  }

  bool transfer(String id, double value) {
    CaixaOperational newCaixaSection = CaixaOperational(this);
    final bool status = newCaixaSection.transfer(id, value);
    return status;
  }
}
