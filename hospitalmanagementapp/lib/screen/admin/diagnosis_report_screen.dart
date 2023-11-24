import 'package:flutter/material.dart';

class DiagnosisReportScreen extends StatefulWidget {
  const DiagnosisReportScreen({Key? key}) : super(key: key);

  @override
  _DiagnosisReportScreenState createState() => _DiagnosisReportScreenState();
}

class _DiagnosisReportScreenState extends State<DiagnosisReportScreen> {
  TextEditingController patientNameController = TextEditingController();
  TextEditingController patientAgeController = TextEditingController();
  TextEditingController diagnosisDateController = TextEditingController();
  TextEditingController doctorNameController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Diagnosis Report'),
        backgroundColor: Colors.lightBlue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Patient Information:',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
              ),
              TextField(
                controller: patientNameController,
                decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(color: Colors.black)),
              ),
              TextField(
                controller: patientAgeController,
                decoration: InputDecoration(
                    labelText: 'Age',
                    labelStyle: TextStyle(color: Colors.black)),
              ),
              TextField(
                controller: diagnosisDateController,
                decoration: InputDecoration(
                    labelText: 'Diagnosis Date',
                    labelStyle: TextStyle(color: Colors.black)),
              ),
              TextField(
                controller: doctorNameController,
                decoration: InputDecoration(
                    labelText: 'Doctor',
                    labelStyle: TextStyle(color: Colors.black)),
              ),
              TextField(
                controller: notesController,
                decoration: InputDecoration(
                    labelText: 'Notes',
                    labelStyle: TextStyle(color: Colors.black)),
                maxLines: 4,
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Save the report or update it in your data model or database
                },
                child: Text('Save Report'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
