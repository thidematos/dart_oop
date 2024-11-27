import 'package:dart_oop/caixa.dart';
import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget {
  final Widget text;
  final void Function() handler;

  const StyledButton(this.text, {required this.handler, super.key});

  StyledButton.action(String text, void Function() action, {super.key})
      : text = Text(
          text,
          style: TextStyle(
            color: colorSchema.fontCTA,
            fontFamily: 'Inter',
            fontSize: 20,
          ),
        ),
        handler = action;

  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: handler,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size.fromWidth(200),
        padding: const EdgeInsets.only(top: 8, bottom: 8, left: 30, right: 30),
        backgroundColor: const Color.fromARGB(145, 9, 46, 62),
      ),
      child: text,
    );
  }
}
