import 'package:flutter/material.dart';

class UserBloodBankScreen extends StatefulWidget {
  const UserBloodBankScreen({Key? key}) : super(key: key);

  @override
  State<UserBloodBankScreen> createState() => _UserBloodBankScreenState();
}

class _UserBloodBankScreenState extends State<UserBloodBankScreen> {
  final List<Map<String, dynamic>> bloodData = [
    {'type': 'O+', 'quantity': 450.0},
    {'type': 'A+', 'quantity': 500.0},
    {'type': 'B-', 'quantity': 300.0},
    {'type': 'AB-', 'quantity': 300.0},
    {'type': 'AB+', 'quantity': 300.0},
    {'type': 'O-', 'quantity': 300.0},
    // Add more blood types as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Blood Bank'),
        backgroundColor:
            Colors.lightBlue, // Change the color based on your design
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Blood Status:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            for (var data in bloodData)
              BloodStatusTile(
                bloodType: data['type'],
                bloodQuantity: data['quantity'],
              ),
          ],
        ),
      ),
    );
  }
}

class BloodStatusTile extends StatelessWidget {
  final String bloodType;
  final double bloodQuantity;

  const BloodStatusTile({
    Key? key,
    required this.bloodType,
    required this.bloodQuantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Blood Type: $bloodType',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Blood Quantity: $bloodQuantity ml',
              style: TextStyle(
                fontSize: 16,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
