import 'package:flutter/material.dart';

class NurseMedication extends StatefulWidget {
  const NurseMedication({Key? key}) : super(key: key);

  @override
  _NurseMedicationState createState() => _NurseMedicationState();
}

class _NurseMedicationState extends State<NurseMedication> {
  String? selectedMedicine; // Change to nullable type
  String dosage = '';
  String frequency = '';
  List<String> medicines = ['Medicine A', 'Medicine B', 'Medicine C'];

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
              'Prescription Details',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: selectedMedicine,
              hint: Text(
                'Select Medicine',
                style: TextStyle(color: Colors.black),
              ),
              onChanged: (value) {
                setState(() {
                  selectedMedicine = value;
                });
              },
              items: medicines.map((medicine) {
                return DropdownMenuItem<String>(
                  value: medicine,
                  child: Text(medicine),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(labelText: 'Dosage'),
              onChanged: (value) {
                setState(() {
                  dosage = value;
                });
              },
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(labelText: 'Frequency'),
              onChanged: (value) {
                setState(() {
                  frequency = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (selectedMedicine != null) {
                  // Save prescription logic goes here
                  // You can use the values of selectedMedicine, dosage, and frequency
                  // to create and save the prescription
                } else {
                  // Handle the case where no medicine is selected
                  print('Please select a medicine.');
                }
              },
              child: Text('Create Prescription'),
            ),
          ],
        ),
      ),
    );
  }
}
