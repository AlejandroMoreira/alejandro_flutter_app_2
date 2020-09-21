import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../modles/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key,
    @required this.transactions,
    @required this.deleteTransaction,
  }) : super(key: key);

  final Transaction transactions;
  final Function deleteTransaction;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {

  Color _color;

  @override
  void initState() {
    const availableColors = [
      Colors.redAccent,
      Colors.blueAccent,
      Colors.deepPurpleAccent,
      Colors.lightGreen
    ];
    super.initState();

    _color = availableColors[Random().nextInt(4)];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(),
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _color,
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                "\$${widget.transactions.amount}",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        title: Text(
          widget.transactions.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(DateFormat.yMEd().format(widget.transactions.date)),
        trailing: MediaQuery.of(context).size.width > 360
            ? FlatButton.icon(
                label: Text("Delete"),
                icon: Icon(Icons.delete),
                textColor: Theme.of(context).errorColor,
                onPressed: () =>
                    widget.deleteTransaction(widget.transactions.id),
              )
            : IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () =>
                    widget.deleteTransaction(widget.transactions.id),
              ),
      ),
    );
  }
}
