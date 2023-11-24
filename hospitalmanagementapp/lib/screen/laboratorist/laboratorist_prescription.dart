import 'package:flutter/material.dart';

class Prescription {
  final String testName;
  final String patientName;

  Prescription({required this.testName, required this.patientName});
}

class LaboratoristPrescription extends StatefulWidget {
  const LaboratoristPrescription({Key? key}) : super(key: key);

  @override
  State<LaboratoristPrescription> createState() =>
      _LaboratoristPrescriptionState();
}

class _LaboratoristPrescriptionState extends State<LaboratoristPrescription> {
  List<Prescription> prescriptions = [
    Prescription(testName: 'Blood Test', patientName: 'John Doe'),
    Prescription(testName: 'Urine Test', patientName: 'Jane Smith'),
    // Add more prescriptions as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Prescription List'),
        backgroundColor: Colors.lightBlue,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Navigate to the screen for adding a prescription
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddPrescriptionScreen(),
                ),
              ).then((newPrescription) {
                // Handle the new prescription added by the laboratorist
                if (newPrescription != null) {
                  setState(() {
                    prescriptions.add(newPrescription);
                  });
                }
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: () {
              // Navigate to the screen for removing a prescription
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RemovePrescriptionScreen(
                    prescriptions: prescriptions,
                  ),
                ),
              ).then((indexToRemove) {
                // Handle the prescription removed by the laboratorist
                if (indexToRemove != null) {
                  setState(() {
                    prescriptions.removeAt(indexToRemove);
                  });
                }
              });
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: prescriptions.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(prescriptions[index].testName),
              subtitle: Text('Patient: ${prescriptions[index].patientName}'),
              onTap: () {
                // Add navigation or action when a prescription is tapped
              },
            ),
          );
        },
      ),
    );
  }
}

class AddPrescriptionScreen extends StatelessWidget {
  final TextEditingController testNameController = TextEditingController();
  final TextEditingController patientNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Prescription'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              style: TextStyle(color: Colors.white),
              controller: testNameController,
              decoration: InputDecoration(labelText: 'Test Name'),
            ),
            TextField(
              style: TextStyle(color: Colors.white),
              controller: patientNameController,
              decoration: InputDecoration(labelText: 'Patient Name'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Pass the new prescription back to the previous screen
                Navigator.pop(
                  context,
                  Prescription(
                    testName: testNameController.text,
                    patientName: patientNameController.text,
                  ),
                );
              },
              child: Text('Add Prescription'),
            ),
          ],
        ),
      ),
    );
  }
}

class RemovePrescriptionScreen extends StatelessWidget {
  final List<Prescription> prescriptions;

  RemovePrescriptionScreen({required this.prescriptions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Remove Prescription'),
      ),
      body: ListView.builder(
        itemCount: prescriptions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(prescriptions[index].testName),
            subtitle: Text('Patient: ${prescriptions[index].patientName}'),
            onTap: () {
              // Pass the index of the prescription to be removed back to the previous screen
              Navigator.pop(context, index);
            },
          );
        },
      ),
    );
  }
}
