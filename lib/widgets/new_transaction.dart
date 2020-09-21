import 'dart:io';

import 'package:alejandroflutterapp2/widgets/adaptive_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _dateController;

  void _submitData() {
    if (_amountController.text.isEmpty) return;

    final title = _titleController.text;
    final amount = double.parse(_amountController.text);

    if (title.isEmpty || amount <= 0 || _dateController == null) return;

    widget.addTransaction(title, amount, _dateController);

    Navigator.of(context).pop(); //Cierra el modal(context) al darle enter
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((value) {
      try {
        setState(() {
          _dateController = value;
        });
      } on FormatException {
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //Atrib
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom +
                10, //Tamaño del teclado
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                //title
                decoration: InputDecoration(labelText: "Title"),
                controller: _titleController,
                onSubmitted: (_) => _submitData,
              ),
              TextField(
                //amount
                decoration: InputDecoration(labelText: "Amount"),
                controller: _amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(_dateController == null
                          ? "No date choosen!!"
                          : DateFormat.yMEd().format(_dateController)),
                    ),
                    AdaptiveButton("Choose Date",_showDatePicker),
                  ],
                ),
              ),
              RaisedButton(
                child: Text("Add Transaction"),
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).buttonColor,
                onPressed: () => _submitData(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
