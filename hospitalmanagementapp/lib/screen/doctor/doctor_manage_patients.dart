import 'package:flutter/material.dart';

class DoctorManagePatient extends StatefulWidget {
  const DoctorManagePatient({super.key});

  @override
  State<DoctorManagePatient> createState() => _DoctorManagePatientState();
}

class _DoctorManagePatientState extends State<DoctorManagePatient> {
  // Example: List of patients with their statuses
  List<Patient> patients = [
    Patient(name: 'John Doe', status: 'Admitted'),
    Patient(name: 'Jane Doe', status: 'In Progress'),
    // Add more patients as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Manage Patients'),

        backgroundColor: Color.fromARGB(
            255, 13, 56, 71), // Set the app bar color to light blue
      ),
      body: ListView.builder(
        itemCount: patients.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white, // Set the tile color to white
            child: ListTile(
              title: Text(
                patients[index].name,
                style: TextStyle(
                    color: Colors.black), // Set the text color to black
              ),
              subtitle: Text(
                'Status: ${patients[index].status}',
                style: TextStyle(color: Colors.black54),
              ),
              onTap: () {
                // Open a page to manage patient status
                _navigateToPatientDetail(patients[index]);
              },
            ),
          );
        },
      ),
    );
  }

  void _navigateToPatientDetail(Patient patient) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PatientDetailPage(patient: patient),
      ),
    );
  }
}

class Patient {
  final String name;
  String status;

  Patient({required this.name, required this.status});
}

class PatientDetailPage extends StatefulWidget {
  final Patient patient;

  PatientDetailPage({required this.patient});

  @override
  _PatientDetailPageState createState() => _PatientDetailPageState();
}

class _PatientDetailPageState extends State<PatientDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Detail'),
        backgroundColor:
            Colors.lightBlue, // Set the app bar color to light blue
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Patient Name: ${widget.patient.name}'),
            SizedBox(height: 20),
            Text('Current Status: ${widget.patient.status}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement logic to update patient status
                _updatePatientStatus();
              },
              child: Text('Update Status'),
            ),
          ],
        ),
      ),
    );
  }

  void _updatePatientStatus() {
    // Implement logic to update patient status
    setState(() {
      // Example: Change the patient status to 'Completed'
      widget.patient.status = 'Completed';
    });
  }
}
