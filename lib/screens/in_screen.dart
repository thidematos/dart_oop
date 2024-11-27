import 'package:dart_oop/classes/customer.dart';
import 'package:dart_oop/ui/customer_info.dart';
import 'package:flutter/material.dart';

class InScreen extends StatelessWidget {
  final void Function(Widget) handler;
  final List<Customer> customers;

  const InScreen({required this.handler, required this.customers, super.key});

  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: customers.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: CustomerInfo(currentCustomer: customers[index]),
        );
      },
    );
  }
}
