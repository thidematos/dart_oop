import 'package:dart_oop/caixa.dart';
import 'package:dart_oop/classes/customer.dart';
import 'package:dart_oop/ui/styled_button.dart';
import 'package:flutter/material.dart';

class CustomerScreen extends StatelessWidget {
  final Customer currentCustomer;

  const CustomerScreen(this.currentCustomer, {super.key});

  @override
  Widget build(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 100,
        ),
        Image.asset(
          'assets/logo.png',
          width: 150,
        ),
        const SizedBox(
          height: 50,
        ),
        Container(
          margin: const EdgeInsets.only(left: 40, right: 40),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(color: colorSchema.fontCTA),
              color: const Color.fromARGB(145, 9, 46, 62),
              borderRadius: const BorderRadius.all(Radius.elliptical(6, 6))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                currentCustomer.name.toUpperCase(),
                style: TextStyle(
                    color: colorSchema.font, fontSize: 24, fontFamily: 'Inter'),
              ),
              Text(
                currentCustomer.id,
                style: TextStyle(
                    color: colorSchema.font, fontSize: 16, fontFamily: 'Inter'),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20, left: 100, right: 100),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'SALDO:',
                style: TextStyle(
                  color: colorSchema.font,
                  fontFamily: 'Inter',
                  fontSize: 20,
                  shadows: [
                    Shadow(
                        color: Colors.black, offset: Offset.fromDirection(1.0))
                  ],
                ),
              ),
              Text(
                'R\$ ${currentCustomer.balance.toStringAsFixed(2)}',
                style: TextStyle(
                  color: colorSchema.fontCTA,
                  fontFamily: 'Inter',
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              StyledButton(
                const Text('SACAR'),
                handler: () {},
              ),
            ],
          ),
        )
      ],
    );
  }
}
