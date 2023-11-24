import 'package:flutter/material.dart';

class AccountantPaymentHistory extends StatefulWidget {
  const AccountantPaymentHistory({Key? key}) : super(key: key);

  @override
  State<AccountantPaymentHistory> createState() =>
      _AccountantPaymentHistoryState();
}

class _AccountantPaymentHistoryState extends State<AccountantPaymentHistory> {
  List<Payment> paymentHistory =
      []; // Assuming Payment is a class to represent payment data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Payment History'),
        backgroundColor: Colors.lightBlue,
      ),
      body: ListView.builder(
        itemCount: paymentHistory.length,
        itemBuilder: (context, index) {
          Payment payment = paymentHistory[index];
          return ListTile(
            tileColor: const Color.fromARGB(255, 255, 255, 255),
            title: Text('Name: ${payment.name}'),
            subtitle: Text('Mobile: ${payment.mobile}'),
            trailing: Text('Amount: ${payment.amount.toString()}'),
          );
        },
      ),
    );
  }
}

class Payment {
  final String name;
  final String mobile;
  final double amount;

  Payment({required this.name, required this.mobile, required this.amount});
}
