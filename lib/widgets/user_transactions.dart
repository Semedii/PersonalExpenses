
import 'package:expenses/models/Transactions.dart';
import 'package:expenses/widgets/new_transactions.dart';
import 'package:expenses/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({ Key? key }) : super(key: key);

  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // NewTransaction(_addnewTransaction),
        // TransactionList(_userTransactions),
      ],
    );
  }
}