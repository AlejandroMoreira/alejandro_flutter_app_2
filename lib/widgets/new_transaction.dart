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
    try {
      widget.addTransaction(
        _titleController.text,
        double.parse(_amountController.text),
      );
    } on FormatException {
      print("Format ERROR");
    }

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

    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
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
                  FlatButton(
                    child: Text(
                      "Choose date",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    textColor: Theme.of(context).primaryColor,
                    onPressed: _showDatePicker,
                  ),
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
    );
  }
}
