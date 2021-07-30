import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expense_planner_udemy/models/transaction.dart';
import 'package:intl/intl.dart';


class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions,this.deleteTx);

  @override
  Widget build(BuildContext context) {
  return  transactions.isEmpty
      ? Center(
        child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Text(
                'No transactions added yet',
                style: Theme.of(context).textTheme.title,
              ),

                SizedBox(height: 20,),

                Container(
                    height: 200,
                    child: Image.asset('assets/images/waiting.png',fit: BoxFit.cover,)
                ),
            ],),
      )

      :ListView.builder(
    itemBuilder: (context,index){
      return Card(
        elevation: 5,
        margin: EdgeInsets.symmetric(vertical: 8,horizontal: 5),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: FittedBox
                (child: Text(
                  '\$${transactions[index].amount}',
                    style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'OpenSans'),
                )
              ),
            ),
          ),

          title: Text(
            transactions[index].title,
            style: Theme.of(context).textTheme.title,
          ),

          subtitle: Text(
            DateFormat.yMMMd().format(transactions[index].date),
            style: TextStyle(fontWeight: FontWeight.bold,),
          ),

          trailing: MediaQuery.of(context).size.width>400
              ?FlatButton.icon(
              onPressed: ()=>deleteTx(transactions[index].id),
              icon: Icon(Icons.delete),
              label: Text('Delete'),
              textColor: Theme.of(context).errorColor,
          )
          :IconButton(
            icon: Icon(Icons.delete),
            color: Theme.of(context).errorColor,
            onPressed: ()=>deleteTx(transactions[index].id),
          ),
        ),
      );
    },
    itemCount: transactions.length,
  );
  }
}

