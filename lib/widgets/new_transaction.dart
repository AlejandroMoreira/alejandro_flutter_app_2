import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    try {
      widget.addTransaction(
        titleController.text,
        double.parse(amountController.text),
      );
    } on FormatException {
      print("Format ERROR");
    }

    Navigator.of(context).pop(); //Cierra el modal(context) al darle enter
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
              controller: titleController,
              onSubmitted: (_) => submitData,
            ),
            TextField(
              //amount
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
              child: Text("Add Transaction"),
              textColor: Colors.deepPurpleAccent,
              onPressed: () => submitData(),
            ),
          ],
        ),
      ),
    );
  }
}
