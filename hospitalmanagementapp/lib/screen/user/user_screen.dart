import 'package:flutter/material.dart';
import 'package:hospitalmanagementapp/screen/user/admit_history.dart';

import 'package:hospitalmanagementapp/screen/user/appointments.dart';
import 'package:hospitalmanagementapp/screen/user/blood_bank.dart';
import 'package:hospitalmanagementapp/screen/user/doctor_list.dart';
import 'package:hospitalmanagementapp/screen/user/medication.dart';
import 'package:hospitalmanagementapp/screen/user/operation_history.dart';
import 'package:hospitalmanagementapp/screen/user/prescription.dart';
import 'package:hospitalmanagementapp/screen/user/user_profie.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('User'), backgroundColor: Colors.lightBlue),
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
                      MaterialPageRoute(builder: (context) => UserProfile()));
                },
              ),
              CustomCard(
                title: 'Appointments',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShowAppointmentScreen()));
                },
              ),
              CustomCard(
                title: 'Doctor list',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DoctorListScreen()));
                },
              ),
              CustomCard(
                title: 'Prescription details',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PrescriptionScreen()));
                },
              ),
              CustomCard(
                title: 'Medication',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MedicationScreen()));
                },
              ),
              CustomCard(
                title: 'Blood bank status',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserBloodBankScreen()));
                },
              ),
              CustomCard(
                title: 'Operation history',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserOperationHistory()));
                },
              ),
              CustomCard(
                title: 'Admit history',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserAdmitHistory()));
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
    'Appointments': Icons.calendar_today,
    'Doctor list': Icons.list,
    'Prescription details': Icons.hotel,
    'Medication': Icons.local_hospital,
    'Blood bank status': Icons.medical_services,
    'Operation history': Icons.report,
    'Admit history': Icons.child_friendly,
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
                fontSize: 18,
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
