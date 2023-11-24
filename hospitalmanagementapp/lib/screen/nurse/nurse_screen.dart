import 'package:flutter/material.dart';
import 'package:hospitalmanagementapp/screen/nurse/nurse_allot_bed.dart';
import 'package:hospitalmanagementapp/screen/nurse/nurse_blood_bank.dart';
import 'package:hospitalmanagementapp/screen/nurse/nurse_manage_patient.dart';
import 'package:hospitalmanagementapp/screen/nurse/nurse_medication.dart';
import 'package:hospitalmanagementapp/screen/nurse/nurse_patient_record.dart';
import 'package:hospitalmanagementapp/screen/nurse/nurse_profile.dart';

class NurseScreen extends StatefulWidget {
  const NurseScreen({super.key});

  @override
  State<NurseScreen> createState() => _NurseScreenState();
}

class _NurseScreenState extends State<NurseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Nurse'), backgroundColor: Colors.lightBlue),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: GridView.count(
            crossAxisCount: 2,
            children: <Widget>[
              CustomCard(
                title: 'Profile',
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NurseProfile()));
                },
              ),
              CustomCard(
                title: 'Manage patients',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NurseManagePatient()));
                },
              ),
              CustomCard(
                title: 'Allot bed',
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NurseAllotBed()));
                },
              ),
              CustomCard(
                title: 'Medication',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NurseMedication()));
                },
              ),
              CustomCard(
                title: 'Blood bank',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NurseBloodBank()));
                },
              ),
              CustomCard(
                title: 'Patient record',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NursePatientRecord()));
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
    'Manage patients': Icons.manage_history,
    'Allot bed': Icons.bed,
    'Medication': Icons.medical_services,
    'Blood bank': Icons.local_hospital,
    'Patient record': Icons.notes,
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
