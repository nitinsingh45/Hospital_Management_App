import 'package:flutter/material.dart';

class NursePatientRecord extends StatefulWidget {
  const NursePatientRecord({Key? key}) : super(key: key);

  @override
  State<NursePatientRecord> createState() => _NursePatientRecordState();
}

class _NursePatientRecordState extends State<NursePatientRecord> {
  // Sample patient data
  List<Map<String, String>> patientRecords = [
    {'name': 'John Doe', 'age': '25', 'gender': 'Male'},
    {'name': 'Jane Doe', 'age': '30', 'gender': 'Female'},
    // Add more patient records as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Patient Record'),
        backgroundColor: Color.fromARGB(255, 13, 56, 71),
      ),
      body: ListView.builder(
        itemCount: patientRecords.length,
        itemBuilder: (context, index) {
          return _buildPatientCard(patientRecords[index]);
        },
      ),
    );
  }

  Widget _buildPatientCard(Map<String, String> patientData) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(patientData['name'] ?? ''),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Age: ${patientData['age'] ?? ''}'),
            Text('Gender: ${patientData['gender'] ?? ''}'),
          ],
        ),
        onTap: () {
          // Handle tapping on a patient record (if needed)
          // You can navigate to a detailed patient screen
        },
      ),
    );
  }
}
