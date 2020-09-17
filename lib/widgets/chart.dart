import 'package:alejandroflutterapp2/modles/transaction.dart';
import 'package:alejandroflutterapp2/widgets/barritas.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  const Chart(this.recentTransactions);

  List<Map<String, Object>> get contenido_barritas {
    return List.generate(
      7,
      (index) {
        final weekDay = DateTime.now().subtract(Duration(days: index));
        var totalSum = 0.0;

        for (int i = 0; i < recentTransactions.length; i++) {
          if (recentTransactions[i].date.day == weekDay.day &&
              recentTransactions[i].date.month == weekDay.month &&
              recentTransactions[i].date.year == weekDay.year) {
            totalSum += recentTransactions[i].amount;
          }
        }

        return {"day": DateFormat.E().format(weekDay), "amount": totalSum};
      },
    );
  }

  double get totalSpending {
    return contenido_barritas.fold(0.0, (sum, element) {
      return sum + element["amount"];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(contenido_barritas);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: contenido_barritas.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: Barritas(
                  data['day'],
                  data['amount'],
                  totalSpending == 0.0
                      ? 0.0
                      : (data['amount'] as double) / totalSpending),
            );
          }).toList(),
        ),
      ),
    );
  }
}
