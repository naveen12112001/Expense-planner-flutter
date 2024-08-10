import 'package:expense_planner/widgets/input_container.dart';
import 'package:expense_planner/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import 'models/transaction.dart';

void main() {
  runApp(AppPage());
}

class AppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'QuickSand',
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> transactions = [
    Transaction(
      id: '1',
      name: 'Adidas Shoes',
      amount: 100000,
      date: DateTime.now(),
    ),
    Transaction(
      id: '2',
      name: 'Weekly Groceries',
      amount: 500,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String inputTxt, String inputAmt) {
    Transaction tx = Transaction(
      id: DateTime.now().toString(),
      name: inputTxt,
      amount: double.parse(inputAmt),
      date: DateTime.now(),
    );
    setState(() {
      transactions.add(tx);
    });
  }

  void bottomSheet(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return Input_Container(addtx: _addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Planner'),
        actions: [
          IconButton(
              onPressed: () {
                bottomSheet(context);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: ListView(
        children: [
          Transaction_List(
            transactions: transactions,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          bottomSheet(context);
        },
      ),
    );
  }
}
