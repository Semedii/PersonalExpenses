import 'package:expenses/models/Transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transactions> transactions;
  final Function deletetx;
  TransactionList(this.transactions, this.deletetx);

 
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 500,
      child: ListView.builder(
        itemBuilder: (ctx, index){
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 5,
            ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: FittedBox(child: Text("\$${transactions[index].amount}")),),
                title: Text(transactions[index].title),
                subtitle: Text(DateFormat.yMMMd().format(transactions[index].date)),
               trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () => deletetx(index),
                    ),
                  ),
          );
          // return Card(
          //       child: Row(
                 
          //         children: [
          //           Container(
          //             margin: EdgeInsets.symmetric(
          //               vertical: 10,
          //               horizontal: 15
          //             ),
          //            padding: EdgeInsets.all(10), 
          //             decoration: BoxDecoration(
          //               border: Border.all(
          //                 color: Colors.black,
          //                 width: 2
          //               )
          //             ),
          //             child: Text("\$${transactions[index].amount.toStringAsFixed(2)}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.purple,),)),
          //           Column(
          //            children:[
          //              Text(transactions[index].title, style: TextStyle(
          //                     fontSize: 16,
          //                     fontWeight: FontWeight.bold,
          //                   ),),
          //              Text(DateFormat.yMMMd().format(transactions[index].date),  style: TextStyle(
          //                     color: Colors.grey,))
          //            ]
          //           )
          //         ],
      
          //       )
          //     );
      },
      itemCount: transactions.length,
         
        
        ),
    );
  }
}