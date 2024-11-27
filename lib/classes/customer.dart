import 'dart:math';

import 'package:flutter/material.dart';

String generateRandom() {
  return Random().nextInt(100).toString().padLeft(3, '0');
}

class Customer {
  Customer({required this.name});

  void Function(Widget)? switchScreen;

  final String name;
  double balance = Random().nextInt(3500).toDouble();
  final String id =
      '${generateRandom()}.${generateRandom()}.${generateRandom()}';
}
