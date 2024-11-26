import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget {
  final Widget text;
  final void Function() handler;

  const StyledButton(this.text, {required this.handler, super.key});

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
