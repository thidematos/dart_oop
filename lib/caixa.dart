import 'package:dart_oop/classes/customer.dart';
import 'package:dart_oop/ui/app_colors.dart';
import 'package:dart_oop/screens/start_screen.dart';
import 'package:flutter/material.dart';

class Caixa extends StatefulWidget {
  const Caixa({super.key});

  @override
  State<Caixa> createState() {
    return _CaixaState();
  }
}

final AppColors colorSchema = AppColors();
final Customer gaita = Customer(name: 'Gaita');
final Customer thiago = Customer(name: 'Thiago');
final Customer joaoMarcelo = Customer(name: 'João Marcelo');
final Customer samuel = Customer(name: 'Samuel');

class _CaixaState extends State<Caixa> {
  Widget? activeScreen;

  List<Customer> customers = [gaita, thiago, joaoMarcelo, samuel];

  @override
  void initState() {
    activeScreen = StartScreen(handler: switchScreen, customers: customers);
    for (int i = 0; i < customers.length; i++) {
      customers[i].switchScreen = switchScreen;
    }
    super.initState();
  }

  void switchScreen(Widget screen) {
    setState(() {
      activeScreen = screen;
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: colorSchema.gradientColor,
                begin: Alignment.topCenter,
                end: Alignment.bottomRight),
          ),
          child: Center(
            child: activeScreen,
          ),
        ),
      ),
    );
  }
}
