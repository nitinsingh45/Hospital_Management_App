import 'package:flutter/material.dart';

class PrescriptionScreen extends StatefulWidget {
  const PrescriptionScreen({Key? key});

  @override
  State<PrescriptionScreen> createState() => _PrescriptionScreenState();
}

class _PrescriptionScreenState extends State<PrescriptionScreen> {
  // Sample prescription data
  final List<Map<String, String>> prescriptions = [
    {
      'doctorName': 'Dr. John Doe',
      'medications': 'Medication A, Medication B',
      'date': '2023-11-09',
    },
    {
      'doctorName': 'Dr. Jane Smith',
      'medications': 'Medication C, Medication D',
      'date': '2023-11-10',
    },
    // Add more prescription data as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Prescription'),
        backgroundColor: Colors.lightBlue,
      ),
      body: ListView.builder(
        itemCount: prescriptions.length,
        itemBuilder: (context, index) {
          return PrescriptionCard(prescription: prescriptions[index]);
        },
      ),
    );
  }
}

class PrescriptionCard extends StatelessWidget {
  final Map<String, String> prescription;

  PrescriptionCard({required this.prescription});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Doctor: ${prescription['doctorName']}',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 8.0),
            Text(
              'Medications: ${prescription['medications']}',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 8.0),
            Text(
              'Prescription Date: ${prescription['date']}',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
