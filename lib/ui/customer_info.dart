import 'package:dart_oop/caixa.dart';
import 'package:dart_oop/classes/customer.dart';
import 'package:dart_oop/screens/customer_screen.dart';
import 'package:dart_oop/ui/styled_button.dart';
import 'package:flutter/widgets.dart';

class CustomerInfo extends StatelessWidget {
  final Customer currentCustomer;

  const CustomerInfo({required this.currentCustomer, super.key});

  @override
  Widget build(context) {
    return StyledButton(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            currentCustomer.name,
            style: TextStyle(
              color: colorSchema.fontCTA,
              fontSize: 16,
            ),
          ),
          Text(currentCustomer.id),
        ],
      ),
      handler: () {
        currentCustomer.switchScreen!(CustomerScreen(currentCustomer));
      },
    );
  }
}
