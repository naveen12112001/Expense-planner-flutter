import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Transaction_List extends StatelessWidget {
  Transaction_List({required this.transactions});
  final List transactions;
  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
            children: [
              Text(
                'No Transactions added yet!',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: 200.0,
                child: Image(
                  image: AssetImage('assets/images/waiting.png'),
                ),
              ),
            ],
          )
        : ListView.builder(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemCount: transactions.length,
            itemBuilder: (context, i) {
              transactions.length;
              return ListTile(
                leading: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFFFFEDDB),
                      width: 3,
                    ),
                  ),
                  child: Text(
                    '${transactions[i].amount}',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                title: Text(
                  transactions[i].name,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  DateFormat('dd-MM-yy').format(transactions[i].date),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            });
  }
}
