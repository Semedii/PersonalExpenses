import 'package:expenses/widgets/chart.dart';
import 'package:expenses/widgets/new_transactions.dart';
import 'package:expenses/widgets/transaction_list.dart';
import 'package:expenses/widgets/user_transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'models/Transactions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
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
  final titlecontroller = TextEditingController();
  final amountController = TextEditingController();
  final List<Transactions> _userTransactions = [
     Transactions(id: "t1", title: "New Shoes", amount: 69.99, date: DateTime.now().subtract(Duration(days: 2))),
  Transactions(id: "t2", title: "New Jacket", amount: 139.99, date: DateTime.now().subtract(Duration(days: 5))),
  Transactions(id: "t3", title: "New Shoes", amount: 69.99, date: DateTime.now()),
 
  ];

  
  void _addnewTransaction( String title,double amount, DateTime chosenDate){
    final Transactions tx = new Transactions(title: title, amount: amount, date: chosenDate, id: DateTime.now().toString());
  setState(() {
    _userTransactions.add(tx);
  });
  Navigator.of(context).pop();
  }
    void _startaddnewtransaction(BuildContext context){
    showModalBottomSheet(context: context, builder: (Bctx) {
      return NewTransaction(_addnewTransaction,);
    },);
  }

 List<Transactions> get recentTransaction{
   return _userTransactions.where((element) {
     return element.date.isAfter(DateTime.now().subtract(Duration(days: 7),),);
   }).toList();
  }
  void deletetransaction(int index){
    setState(){
      _userTransactions.removeAt(index);
    }
    print(index);
  }

  @override
  Widget build(BuildContext context) {
    final appBar =AppBar(
      
        title: Text("Personal Expenses"),
        actions: [
          IconButton(onPressed: ()=> _startaddnewtransaction(context), icon: Icon(Icons.add, color: Colors.white ))
        ],
      );
      
    return Scaffold(
     
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children:[
            Container(
             height: (MediaQuery.of(context).size.height-appBar.preferredSize.height)*.3,
              width: double.infinity,
              color: Colors.blue,
              child: Card(
                child: Chart(recentTransaction),
                elevation: 5,
              ),
            ),
            
            Container(
              height: (MediaQuery.of(context).size.height-appBar.preferredSize.height-MediaQuery.of(context).padding.top)*.7,
              child: TransactionList(_userTransactions, deletetransaction)),
           // UserTransaction()
          //   NewTransaction(),
          //  TransactionList()
          ]
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () =>  _startaddnewtransaction(context),
      )
      
     
    );
  } 

}