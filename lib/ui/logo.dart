import 'package:dart_oop/caixa.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'ASICAIXA',
          style: TextStyle(
            color: colorSchema.font,
            fontFamily: 'Inter',
            fontSize: 36,
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        Image.asset(
          'assets/logo.png',
          width: 50,
        ),
      ],
    );
  }
}
