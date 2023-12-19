import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  const TransactionForm(this.onSubmit, {super.key});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleControler = TextEditingController();

  final valueControler = TextEditingController();

  _submitForm() {
    final title = titleControler.text;
    final value = double.tryParse(valueControler.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }

    widget.onSubmit(title, value);
  }

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
                onSubmitted: (_) => _submitForm(),
                decoration: const InputDecoration(
                  labelText: 'Título',
                ),
              ),
              TextField(
                controller: valueControler,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                    onSubmitted: (_) => _submitForm(),
                decoration: const InputDecoration(
                  labelText: 'Valor (R\$)',
                ),
              ),
              SizedBox(
                height: 70,
                child: Row(
                  children: <Widget>[
                    const Text('Nenhuma data selecionada'),
                    TextButton(
                    style: ButtonStyle(foregroundColor: MaterialStatePropertyAll(Theme.of(context).primaryColor)),
                    onPressed: () {},  
                    child: const Text(
                      'Selecionar Data',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  ElevatedButton(
                    style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Theme.of(context).primaryColor),
                    foregroundColor: const MaterialStatePropertyAll(Colors.white), 
                    ),
                    onPressed: _submitForm,
                    child: const Text('Nova Transação'),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
