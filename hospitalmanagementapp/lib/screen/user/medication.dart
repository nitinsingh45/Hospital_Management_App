import 'package:flutter/material.dart';

class MedicationScreen extends StatefulWidget {
  const MedicationScreen({Key? key}) : super(key: key);

  @override
  State<MedicationScreen> createState() => _MedicationScreenState();
}

class _MedicationScreenState extends State<MedicationScreen> {
  // Sample list of medications
  List<String> medications = [
    'Medication A',
    'Medication B',
    'Medication C',
    'Medication D',
    'Medication E',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Medication'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Patient Medications:',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: medications.length,
                itemBuilder: (context, index) {
                  return MedicationItem(medication: medications[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MedicationItem extends StatelessWidget {
  final String medication;

  const MedicationItem({Key? key, required this.medication}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(15.0), // Adjust the radius as needed
      ),
      color: Color.fromARGB(
          255, 255, 255, 255), // Change this line to set the background color
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0), // Same radius as above
        child: ListTile(
          title: Text(
            medication,
            style: TextStyle(
                color: Color.fromARGB(
                    255, 0, 0, 0)), // Adjust text color as needed
          ),
          // Add more details or actions related to the medication here
        ),
      ),
    );
  }
}
