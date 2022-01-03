import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
 final Function tx;
 NewTransaction(this.tx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titlecontroller = TextEditingController();

  final amountController = TextEditingController();
    DateTime? chosenDate;

  void submitdata(){
    final enteredtitle = titlecontroller.text;
    final enteredamount = double.parse(amountController.text);
    if(enteredamount<=0 || enteredtitle.isEmpty || chosenDate==null){
      return;
    }

 widget.tx(titlecontroller.text, double.parse(amountController.text), chosenDate);   
  }

  void presentDate(){
    showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2019), 
      lastDate: DateTime.now(),
      ).then((value) {
        if(value==null){
          return;
        }
        setState(() {
           chosenDate = value;
        });
       
      });
      print("called");
  }

  @override
  Widget build(BuildContext context) {
    return  Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Title"
                    ),
                   controller: titlecontroller,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: "Amount"),
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    onSubmitted: (_) =>submitdata(),
                   
                  ),
                  Row(
                    children:[
                      Text(chosenDate==null? "No Date chosen" : DateFormat.yMd().format(chosenDate!)),
                      FlatButton(
                       textColor: Theme.of(context).primaryColor,
                       onPressed:  presentDate,
                        child: Text("Choose Date", style: TextStyle(fontWeight: FontWeight.bold),)
                        )
                    ]
                  ),
                  FlatButton(onPressed: submitdata,
                  child: Text("Add Transaction"),
                  textColor: Colors.purple,),
                  
                ],
              ),
            ),
          );
  }
}