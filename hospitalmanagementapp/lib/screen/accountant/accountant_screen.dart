import 'package:flutter/material.dart';
import 'package:hospitalmanagementapp/screen/accountant/accountant_create_invoice.dart';
import 'package:hospitalmanagementapp/screen/accountant/accountant_payment_history.dart';
import 'package:hospitalmanagementapp/screen/accountant/accountant_profile.dart';
import 'package:hospitalmanagementapp/screen/accountant/accountant_take_cash.dart';

class AccountantScreen extends StatefulWidget {
  const AccountantScreen({super.key});

  @override
  State<AccountantScreen> createState() => _AccountantScreenState();
}

class _AccountantScreenState extends State<AccountantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
          AppBar(title: Text('Accountant'), backgroundColor: Colors.lightBlue),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: GridView.count(
            crossAxisCount: 2,
            children: <Widget>[
              CustomCard(
                title: 'Profile',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AccountantProfile()));
                },
              ),
              CustomCard(
                title: 'Create invoice',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AccountantCreateInvoice()));
                },
              ),
              CustomCard(
                title: 'Take cash',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AccountantTakeCash()));
                },
              ),
              CustomCard(
                title: 'Payment history',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AccountantPaymentHistory()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  CustomCard({required this.title, required this.onPressed});

  // Define a mapping from titles to icons
  // Updated mapping from titles to icons
  static const Map<String, IconData> titleToIcon = {
    'Profile': Icons.business,
    'Create invoice': Icons.receipt,
    'Order invoice': Icons.receipt_long,
    'Take cash': Icons.money,
    'Payment history': Icons.payment_sharp,
  };

  @override
  Widget build(BuildContext context) {
    IconData? icon = titleToIcon[title];

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.lightBlueAccent, Colors.blue],
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon ?? Icons.business, // Use the mapped icon or a default icon
              color: Colors.white,
              size: 40,
            ),
            SizedBox(height: 16),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: onPressed,
              child: Text(
                'Open',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                textStyle: MaterialStateProperty.all(
                  TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
