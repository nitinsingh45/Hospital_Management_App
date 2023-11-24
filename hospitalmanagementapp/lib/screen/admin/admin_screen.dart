import 'package:flutter/material.dart';
import 'package:hospitalmanagementapp/screen/admin/appointment_screen.dart';
import 'package:hospitalmanagementapp/screen/admin/bed_status_screen.dart';
import 'package:hospitalmanagementapp/screen/admin/birth_report_screen.dart';
import 'package:hospitalmanagementapp/screen/admin/blood_bank_screen.dart';
import 'package:hospitalmanagementapp/screen/admin/death_report_screen.dart';
import 'package:hospitalmanagementapp/screen/admin/department_screen.dart';
import 'package:hospitalmanagementapp/screen/admin/diagnosis_report_screen.dart';
import 'package:hospitalmanagementapp/screen/admin/medicine_status_screen.dart';
import 'package:hospitalmanagementapp/screen/admin/operation_report_screen.dart';
import 'package:hospitalmanagementapp/screen/admin/transaction_screen.dart';

class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Admin'), backgroundColor: Colors.lightBlue),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: GridView.count(
            crossAxisCount: 2,
            children: <Widget>[
              CustomCard(
                title: 'Department',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DepartmentScreen(),
                    ),
                  );
                },
              ),
              CustomCard(
                title: 'Appointment',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AppointmentScreen(),
                    ),
                  );
                },
              ),
              CustomCard(
                title: 'Transaction',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TransactionScreen(),
                    ),
                  );
                },
              ),
              CustomCard(
                title: 'Bed status',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BedStatusScreen(),
                    ),
                  );
                },
              ),
              CustomCard(
                title: 'Blood bank',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BloodBankScreen(),
                    ),
                  );
                },
              ),
              CustomCard(
                title: 'Medicine status',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MedicineStatus(),
                    ),
                  );
                },
              ),
              CustomCard(
                title: 'Operation Report',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OperationReport(),
                      ));
                },
              ),
              CustomCard(
                title: 'Birth Report',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BirthReportScreen()));
                },
              ),
              CustomCard(
                title: 'Diagnosis Report',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DiagnosisReportScreen()));
                },
              ),
              CustomCard(
                title: 'Death Report',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DeathReportScreen()));
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
  static const Map<String, IconData> titleToIcon = {
    'Department': Icons.business,
    'Appointment': Icons.calendar_today,
    'Transaction': Icons.attach_money,
    'Bed status': Icons.hotel,
    'Blood bank': Icons.local_hospital,
    'Medicine status': Icons.medical_services,
    'Operation Report': Icons.report,
    'Birth Report': Icons.child_friendly,
    'Diagnosis Report': Icons.healing,
    'Death Report': Icons.mood_bad,
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
