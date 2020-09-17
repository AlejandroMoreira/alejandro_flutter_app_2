import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../modles/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300, //List view necesita un tamaño
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  "No transactions added yet!!",
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  //Espacio en blanco
                  height: 10,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    "assets/images/waiting.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(),
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text(
                            "\$${transactions[index].amount}",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle:
                        Text(DateFormat.yMEd().format(transactions[index].date)),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
