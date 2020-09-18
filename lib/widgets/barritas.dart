import 'package:flutter/material.dart';

class Barritas extends StatelessWidget {
  final String label;
  final double amount;
  final double amountPct;

  Barritas(this.label, this.amount, this.amountPct);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, contrains) {
        return Column(
          children: [
            Container(
              height: contrains.maxHeight * 0.15,
              child: FittedBox(
                child: Text("\$${amount.toStringAsFixed(0)}"),
              ),
            ),
            SizedBox(
              height: contrains.maxHeight * 0.05,
            ),
            Container(
              height: contrains.maxHeight * 0.6,
              width: 10,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: amountPct,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: contrains.maxHeight * 0.05,
            ),
            Container(
              height: contrains.maxHeight * 0.15,
              child: FittedBox(
                child: Text(label),
              ),
            ),
          ],
        );
      },
    );
  }
}
