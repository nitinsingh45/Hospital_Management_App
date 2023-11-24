import 'package:flutter/material.dart';

class DeathReportScreen extends StatefulWidget {
  const DeathReportScreen({super.key});

  @override
  State<DeathReportScreen> createState() => _DeathReportScreenState();
}

class _DeathReportScreenState extends State<DeathReportScreen> {
  TextEditingController patientNameController = TextEditingController();
  TextEditingController CauseofDeathController = TextEditingController();
  TextEditingController PlaceOfDeathController = TextEditingController();
  TextEditingController TimeOfDeathController = TextEditingController();
  TextEditingController PatientDataController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Death Report'),
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
                    labelText: 'Name of Patient',
                    labelStyle: TextStyle(color: Colors.black)),
              ),
              TextField(
                controller: CauseofDeathController,
                decoration: InputDecoration(
                    labelText: 'Cause of Death',
                    labelStyle: TextStyle(color: Colors.black)),
              ),
              TextField(
                controller: TimeOfDeathController,
                decoration: InputDecoration(
                    labelText: 'Time',
                    labelStyle: TextStyle(color: Colors.black)),
              ),
              TextField(
                controller: PatientDataController,
                decoration: InputDecoration(
                    labelText: 'Enter Data',
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
