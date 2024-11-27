import 'package:dart_oop/caixa.dart';
import 'package:dart_oop/classes/customer.dart';
import 'package:dart_oop/screens/in_screen.dart';
import 'package:dart_oop/ui/styled_button.dart';
import 'package:flutter/material.dart';

class CustomerScreen extends StatefulWidget {
  final Customer currentCustomer;

  const CustomerScreen(this.currentCustomer, {super.key});

  @override
  State<CustomerScreen> createState() {
    return _CustomerScreenState();
  }
}

class _CustomerScreenState extends State<CustomerScreen> {
  Map<String, bool> activeOperations = {
    'withdraw': false,
    'deposit': false,
    'transfer': false,
  };

  void showForm(String type) {
    myController.value = const TextEditingValue(text: '0');
    myControllerID.value = TextEditingValue.empty;

    activeOperations.forEach((key, value) {
      if (key != type) {
        activeOperations[key] = false;
      }
    });

    setState(() {
      activeOperations[type] = !activeOperations[type]!;
    });
  }

  double currentValue = 0.0;

  final myController = TextEditingController();
  final myControllerID = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    myControllerID.dispose();
    super.dispose();
  }

  void changeValue(value) {
    print(value);
    setState(() {
      currentValue = double.parse(value);
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 50,
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
                widget.currentCustomer.name.toUpperCase(),
                style: TextStyle(
                    color: colorSchema.font, fontSize: 24, fontFamily: 'Inter'),
              ),
              Text(
                widget.currentCustomer.id,
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
                'R\$ ${widget.currentCustomer.balance.toStringAsFixed(2)}',
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
              StyledButton.action(
                'SACAR',
                () {
                  print(widget.currentCustomer.balance);
                  showForm('withdraw');
                },
              ),
              if (activeOperations['withdraw']!)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 150,
                      child: TextField(
                        controller: myController,
                        style: TextStyle(color: colorSchema.font),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          changeValue(value);
                        },
                      ),
                    ),
                    OutlinedButton.icon(
                      onPressed: () {
                        widget.currentCustomer.withdraw(currentValue);
                        showForm('withdraw');
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                      ),
                      icon: const Icon(Icons.add_card),
                      label: const Text(
                        '+',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                child: StyledButton.action(
                  'DEPOSITAR',
                  () {
                    showForm('deposit');
                  },
                ),
              ),
              if (activeOperations['deposit']!)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 150,
                      child: TextField(
                        controller: myController,
                        style: TextStyle(color: colorSchema.font),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          changeValue(value);
                        },
                      ),
                    ),
                    OutlinedButton.icon(
                      onPressed: () {
                        widget.currentCustomer.deposit(currentValue);
                        showForm('deposit');
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                      ),
                      icon: const Icon(Icons.attach_money_sharp),
                      label: const Text(
                        '+',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                child: StyledButton.action(
                  'TRANSFERIR',
                  () {
                    showForm('transfer');
                  },
                ),
              ),
              if (activeOperations['transfer']!)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: 150,
                          child: TextField(
                            controller: myControllerID,
                            style: TextStyle(color: colorSchema.font),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: TextField(
                            controller: myController,
                            style: TextStyle(color: colorSchema.font),
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              changeValue(value);
                            },
                          ),
                        ),
                      ],
                    ),
                    OutlinedButton.icon(
                      onPressed: () {
                        widget.currentCustomer
                            .transfer(myControllerID.text, currentValue);
                        showForm('transfer');
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                      ),
                      icon: const Icon(Icons.currency_exchange_sharp),
                      label: const Text(
                        '+',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 50),
          height: 250,
          width: 350,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.currentCustomer.allTransactions.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                      border: Border.all(color: colorSchema.fontCTA)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            widget.currentCustomer.allTransactions[index].type,
                            style: TextStyle(color: colorSchema.font),
                          ),
                          Text(
                            'R\$ ${widget.currentCustomer.allTransactions[index].value.toString()}',
                            style: TextStyle(color: colorSchema.fontCTA),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          if (widget.currentCustomer.allTransactions[index]
                              .destination.isNotEmpty)
                            Text(
                              'Para: ${widget.currentCustomer.allTransactions[index].destination!.toUpperCase()}',
                              style: TextStyle(color: colorSchema.font),
                            ),
                          Text(
                            '${widget.currentCustomer.allTransactions[index].time.day}/${widget.currentCustomer.allTransactions[index].time.month}/${widget.currentCustomer.allTransactions[index].time.year} - ${widget.currentCustomer.allTransactions[index].time.hour}:${widget.currentCustomer.allTransactions[index].time.minute}',
                            style: TextStyle(color: colorSchema.font),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        OutlinedButton.icon(
          onPressed: () {
            widget.currentCustomer.switchScreen!(
                InScreen(handler: widget.currentCustomer.switchScreen));
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
          ),
          icon: const Icon(Icons.logout),
          label: const Text(
            'ENCERRAR SESSÃO',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
//070.096.065