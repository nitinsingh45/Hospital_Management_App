import 'package:flutter/material.dart';

class TransactionScreen extends StatefulWidget {
  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  // Replace this with actual data, or fetch data from an API or database
  List<Transaction> transactions = [
    Transaction('User 1', 100.00),
    Transaction('User 2', 75.50),
    Transaction('User 3', 150.25),
  ];

  @override
  Widget build(BuildContext context) {
    double total = transactions.fold(
        0, (total, transaction) => total + transaction.amount);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Transaction'),
        backgroundColor: Color.fromARGB(255, 13, 56, 71),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              'Total Transactions: \$${total.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  return TransactionCard(transaction: transactions[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Transaction {
  final String userName;
  final double amount;

  Transaction(this.userName, this.amount);
}

class TransactionCard extends StatelessWidget {
  final Transaction transaction;

  TransactionCard({required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: Icon(Icons.account_circle),
        title: Text('User: ${transaction.userName}'),
        subtitle: Text('Amount: \$${transaction.amount.toStringAsFixed(2)}'),
      ),
    );
  }
}
