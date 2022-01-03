import 'package:flutter/material.dart';

class charbar extends StatelessWidget {
  final String label;
  final double spendingamount;
  final double spendingpctoftotal;
  charbar(this.label, this.spendingamount, this.spendingpctoftotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Column(
        children: [
          Container(
            height: constraints.maxHeight*0.15,
            child: Text("\$${spendingamount.toStringAsFixed(0)}")),
          SizedBox(height:  constraints.maxHeight * .05),
          Container(
            height: constraints.maxHeight * .6,
            width: 10,
            child: Stack(
              children: [
                Container(
                    decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: Color.fromRGBO(220, 220, 220, 1),
                )),
                FractionallySizedBox(
                  heightFactor: spendingpctoftotal,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: constraints.maxHeight * .05),
          Container(
           height: constraints.maxHeight * .15,
            child: FittedBox  (child: Text(label)))
        ],
      );
    });
  }
}
