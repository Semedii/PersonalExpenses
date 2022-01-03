import 'package:expenses/models/Transactions.dart';
import 'package:expenses/widgets/ChartBar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transactions> recentTransactions;
  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues{
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalsum=0.0;
      for(int i=0; i<recentTransactions.length; i++){
        if(recentTransactions[i].date.day ==weekDay.day &&
           recentTransactions[i].date.month==weekDay.month &&
           recentTransactions[i].date.year==weekDay.year){
             totalsum+=recentTransactions[i].amount;
           }
      }
      return{
        "day":DateFormat.E().format(weekDay).substring(0,1),
        "amount": totalsum,
      };
      
    }).reversed.toList();
  }
double get totalSpending{
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + (item['amount']as double)  ;
    });
}


  @override
  Widget build(BuildContext context) {
   
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
        ...groupedTransactionValues.map((e) {
          return charbar(e["day"] as String, e["amount"] as double, totalSpending==0? 0.0 : ((e["amount"] as double)/totalSpending
          ));
        }).toList()
      ],),
      
    );
  }
}