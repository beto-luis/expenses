import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  TransactionForm({super.key});
  final titleControler = TextEditingController();
  final valueControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              TextField(
                controller: titleControler,
                decoration: const InputDecoration(
                  labelText: 'Título',
                ),
              ),
              TextField(
                controller: valueControler,
                decoration: const InputDecoration(
                  labelText: 'Valor (R\$)',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    style: const ButtonStyle(
                      foregroundColor: MaterialStatePropertyAll(Colors.purple),
                    ),
                    child: const Text('Nova Transação'),
                    onPressed: () {
                      // ignore: avoid_print
                      print(titleControler.text);
                      // ignore: avoid_print
                      print(valueControler.value);
                    },
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
