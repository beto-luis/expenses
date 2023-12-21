import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  const TransactionForm(this.onSubmit, {super.key});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleControler = TextEditingController();
  final _valueControler = TextEditingController();
  DateTime? _selectadeDate = DateTime.now();

  _submitForm() {
    final title = _titleControler.text;
    final value = double.tryParse(_valueControler.text) ?? 0.0;

    if (title.isEmpty || value <= 0 || _selectadeDate == null) {
      return;
    }

    widget.onSubmit(title, value, _selectadeDate!);
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectadeDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.only(
              top: 10,
              right: 10,
              left: 10,
              bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _titleControler,
                  onSubmitted: (_) => _submitForm(),
                  decoration: const InputDecoration(
                    labelText: 'Título',
                  ),
                ),
                TextField(
                  controller: _valueControler,
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
                      Expanded(
                        child: Text(
                          _selectadeDate == (null)
                              ? 'Nenhuma data selecionada!'
                              : 'Data Selecionada: ${DateFormat('dd/MM/y').format(_selectadeDate!)}',
                        ),
                      ),
                      TextButton(
                        style: ButtonStyle(
                            foregroundColor: MaterialStatePropertyAll(
                                Theme.of(context).primaryColor)),
                        onPressed: _showDatePicker,
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
                        backgroundColor: MaterialStatePropertyAll(
                            Theme.of(context).primaryColor),
                        foregroundColor:
                            const MaterialStatePropertyAll(Colors.white),
                      ),
                      onPressed: _submitForm,
                      child: const Text('Nova Transação'),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
