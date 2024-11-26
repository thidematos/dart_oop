import 'package:dart_oop/caixa.dart';
import 'package:dart_oop/classes/customer.dart';
import 'package:dart_oop/ui/logo.dart';
import 'package:dart_oop/ui/styled_button.dart';
import 'package:flutter/material.dart';

class InScreen extends StatelessWidget {
  final void Function(Widget) handler;

  InScreen({required this.handler, super.key});

  List<Customer> customers = [
    Customer(name: 'Thiago Matos'),
    Customer(name: 'João Marcelo'),
    Customer(name: 'Gaita'),
    Customer(name: 'Samuel')
  ];

  void switchToCreate() {
    handler(const Text('Oi cu'));
  }

  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: customers.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(customers[index].name),
        );
      },
    );
  }
}
