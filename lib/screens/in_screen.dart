import 'package:dart_oop/caixa.dart';
import 'package:dart_oop/ui/customer_info.dart';
import 'package:flutter/material.dart';

class InScreen extends StatelessWidget {
  final void Function(Widget)? handler;

  const InScreen({required this.handler, super.key});

  @override
  Widget build(context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 250),
      itemCount: customers.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: CustomerInfo(currentCustomer: customers[index]),
        );
      },
    );
  }
}
//002.017.032