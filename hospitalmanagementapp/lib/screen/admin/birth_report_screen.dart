import 'package:flutter/material.dart';

class BirthReportScreen extends StatefulWidget {
  const BirthReportScreen({super.key});

  @override
  State<BirthReportScreen> createState() => _BirthReportScreenState();
}

class _BirthReportScreenState extends State<BirthReportScreen> {
  List<BirthReport> birthReports = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Birth Report'),
        backgroundColor: Colors.lightBlue,
      ),
      body: ListView.builder(
        itemCount: birthReports.length,
        itemBuilder: (context, index) {
          final report = birthReports[index];
          return Card(
            margin: EdgeInsets.all(10),
            elevation: 5,
            child: ListTile(
              title: Text(
                'Baby Name: ${report.babyName}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Mother Name: ${report.motherName}',
                      style: TextStyle(color: Colors.white)),
                  Text('Baby Weight: ${report.babyWeight} kg',
                      style: TextStyle(color: Colors.white)),
                  Text('Baby Health: ${report.babyHealth}',
                      style: TextStyle(color: Colors.white)),
                  Text('Blood Group: ${report.bloodGroup}',
                      style: TextStyle(color: Colors.white)),
                ],
              ),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  _editBirthReport(context, report);
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addBirthReport(context);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.lightBlue,
      ),
    );
  }

  void _addBirthReport(BuildContext context) {
    String babyName = "Baby X";
    String motherName = "";
    String babyWeight = "";
    String babyHealth = "";
    String bloodGroup = "";

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:
              Text('Add Birth Report', style: TextStyle(color: Colors.white)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Mother Name',
                    labelStyle: TextStyle(color: Colors.white)),
                style:
                    TextStyle(color: Colors.white), // Set text color to white
                onChanged: (value) {
                  motherName = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Baby Weight (kg)',
                    labelStyle: TextStyle(color: Colors.white)),
                style:
                    TextStyle(color: Colors.white), // Set text color to white
                onChanged: (value) {
                  babyWeight = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Baby Health',
                    labelStyle: TextStyle(color: Colors.white)),
                style:
                    TextStyle(color: Colors.white), // Set text color to white
                onChanged: (value) {
                  babyHealth = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Blood Group',
                    labelStyle: TextStyle(color: Colors.white)),
                style:
                    TextStyle(color: Colors.white), // Set text color to white
                onChanged: (value) {
                  bloodGroup = value;
                },
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel', style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () {
                final newReport = BirthReport(
                  babyName: babyName,
                  motherName: motherName,
                  babyWeight: double.tryParse(babyWeight) ?? 0.0,
                  babyHealth: babyHealth,
                  bloodGroup: bloodGroup,
                );
                setState(() {
                  birthReports.add(newReport);
                });
                Navigator.of(context).pop();
              },
              child: Text('Save', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  void _editBirthReport(BuildContext context, BirthReport report) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String updatedMotherName = report.motherName;
        String updatedBabyWeight = report.babyWeight.toString();
        String updatedBabyHealth = report.babyHealth;
        String updatedBloodGroup = report.bloodGroup;

        return AlertDialog(
          title:
              Text('Edit Birth Report', style: TextStyle(color: Colors.white)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                initialValue: updatedMotherName,
                decoration: InputDecoration(
                    labelText: 'Mother Name',
                    labelStyle: TextStyle(color: Colors.white)),
                style:
                    TextStyle(color: Colors.white), // Set text color to white
                onChanged: (value) {
                  updatedMotherName = value;
                },
              ),
              TextFormField(
                initialValue: updatedBabyWeight,
                decoration: InputDecoration(
                    labelText: 'Baby Weight (kg)',
                    labelStyle: TextStyle(color: Colors.white)),
                style:
                    TextStyle(color: Colors.white), // Set text color to white
                onChanged: (value) {
                  updatedBabyWeight = value;
                },
              ),
              TextFormField(
                initialValue: updatedBabyHealth,
                decoration: InputDecoration(
                    labelText: 'Baby Health',
                    labelStyle: TextStyle(color: Colors.white)),
                style: TextStyle(color: Colors.white),
                onChanged: (value) {
                  updatedBabyHealth = value;
                },
              ),
              TextFormField(
                initialValue: updatedBloodGroup,
                decoration: InputDecoration(
                    labelText: 'Blood Group',
                    labelStyle: TextStyle(color: Colors.white)),
                style: TextStyle(color: Colors.white),
                onChanged: (value) {
                  updatedBloodGroup = value;
                },
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel', style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  report.motherName = updatedMotherName;
                  report.babyWeight = double.tryParse(updatedBabyWeight) ?? 0.0;
                  report.babyHealth = updatedBabyHealth;
                  report.bloodGroup = updatedBloodGroup;
                });
                Navigator.of(context).pop();
              },
              child: Text('Save', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }
}

class BirthReport {
  String babyName;
  String motherName;
  double babyWeight;
  String babyHealth;
  String bloodGroup;

  BirthReport({
    required this.babyName,
    this.motherName = "",
    this.babyWeight = 0.0,
    this.babyHealth = "",
    this.bloodGroup = "",
  });
}
