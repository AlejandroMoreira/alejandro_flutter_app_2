import 'package:flutter/material.dart';

import 'modles/transaction.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App - Alejandro',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.deepPurpleAccent,
        fontFamily: "QuickSand",
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: "OpenSans",
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: "OpenSans",
                  fontSize: 20,
//                  fontWeight: FontWeight.bold
                ),
              ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transaccions = [
//    Transaction(
//      id: 't1',
//      title: "New shoes",
//      amount: 14.99,
//      date: DateTime.now(),
//    ),
//    Transaction(
//      id: 't2',
//      title: "Weekly Groceries",
//      amount: 16.52,
//      date: DateTime.now(),
//    ),
//    Transaction(
//      id: 't1',
//      title: "New shoes",
//      amount: 14.99,
//      date: DateTime.now(),
//    ),
//    Transaction(
//      id: 't2',
//      title: "Weekly Groceries",
//      amount: 16.52,
//      date: DateTime.now(),
//    ),
//    Transaction(
//      id: 't1',
//      title: "New shoes",
//      amount: 14.99,
//      date: DateTime.now(),
//    ),
//    Transaction(
//      id: 't2',
//      title: "Weekly Groceries",
//      amount: 16.52,
//      date: DateTime.now(),
//    ),
  ];

  List<Transaction> get _recentTransactions {
    return _transaccions.where((element) {
      return element.date.isAfter(DateTime.now().subtract(Duration(
        days: 7,
      )));
    }).toList();
  }

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _transaccions.add(newTx);
    });
  }

  void _showAddTransationMenu(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: NewTransaction(_addNewTransaction),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter App"),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _showAddTransationMenu(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
//            mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Chart(_recentTransactions),
            TransactionList(_transaccions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _showAddTransationMenu(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
