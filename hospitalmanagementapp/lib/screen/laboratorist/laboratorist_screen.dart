import 'package:flutter/material.dart';
import 'package:hospitalmanagementapp/screen/laboratorist/laboratorist_diagnostic_report.dart';
import 'package:hospitalmanagementapp/screen/laboratorist/laboratorist_prescription.dart';
import 'package:hospitalmanagementapp/screen/laboratorist/laboratorist_profile.dart';
import 'package:hospitalmanagementapp/screen/laboratorist/laboratorist_report_files.dart';

class LaboratoristScreen extends StatefulWidget {
  const LaboratoristScreen({super.key});

  @override
  State<LaboratoristScreen> createState() => _LaboratoristScreenState();
}

class _LaboratoristScreenState extends State<LaboratoristScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text('Laboratorist'), backgroundColor: Colors.lightBlue),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: GridView.count(
            crossAxisCount: 2,
            children: <Widget>[
              CustomCard(
                title: 'Profile',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LaboratoristProfile()));
                },
              ),
              CustomCard(
                title: 'Prescription list',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LaboratoristPrescription()));
                },
              ),
              CustomCard(
                title: 'Diagnostic report',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              LaboratoristDiagnosticReport()));
                },
              ),
              CustomCard(
                title: 'Report files',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LaboratoristReportFiles()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  CustomCard({required this.title, required this.onPressed});

  // Define a mapping from titles to icons
  // Updated mapping from titles to icons
  static const Map<String, IconData> titleToIcon = {
    'Profile': Icons.business,
    'Prescription list': Icons.medical_information_outlined,
    'Diagnostic report': Icons.medical_information_sharp,
    'Report files': Icons.file_copy_outlined,
  };

  @override
  Widget build(BuildContext context) {
    IconData? icon = titleToIcon[title];

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.lightBlueAccent, Colors.blue],
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon ?? Icons.business, // Use the mapped icon or a default icon
              color: Colors.white,
              size: 40,
            ),
            SizedBox(height: 16),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: onPressed,
              child: Text(
                'Open',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                textStyle: MaterialStateProperty.all(
                  TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
