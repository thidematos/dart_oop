import 'package:dart_oop/classes/customer.dart';
import 'package:dart_oop/screens/in_screen.dart';
import 'package:dart_oop/ui/logo.dart';
import 'package:dart_oop/ui/styled_button.dart';
import 'package:flutter/material.dart';
import 'package:dart_oop/caixa.dart';

class StartScreen extends StatelessWidget {
  final void Function(Widget) handler;

  const StartScreen({required this.handler, super.key});

  void switchToCreate() {
    handler(InScreen(
      handler: handler,
    ));
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Logo(),
        Column(
          children: [
            StyledButton(
              Text(
                'ENTRAR',
                style: TextStyle(color: colorSchema.fontCTA, fontSize: 20),
              ),
              handler: switchToCreate,
            )
          ],
        )
      ],
    );
  }
}
