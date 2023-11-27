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
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text('Admin Dashboard'),
        backgroundColor: Color.fromARGB(255, 13, 56, 71),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                height: 170,
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 253, 254, 255),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage('images/adminBanner.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  children: <Widget>[
                    CustomCard(
                      title: 'Department',
                      onPressed: () {
                        navigateToScreen(DepartmentScreen());
                      },
                    ),
                    CustomCard(
                      title: 'Appointment',
                      onPressed: () {
                        navigateToScreen(AppointmentScreen());
                      },
                    ),
                    CustomCard(
                      title: 'Transaction',
                      onPressed: () {
                        navigateToScreen(TransactionScreen());
                      },
                    ),
                    CustomCard(
                      title: 'Bed Status',
                      onPressed: () {
                        navigateToScreen(BedStatusScreen());
                      },
                    ),
                    CustomCard(
                      title: 'Blood Bank',
                      onPressed: () {
                        navigateToScreen(BloodBankScreen());
                      },
                    ),
                    CustomCard(
                      title: 'Medicine Status',
                      onPressed: () {
                        navigateToScreen(MedicineStatus());
                      },
                    ),
                    CustomCard(
                      title: 'Operation Report',
                      onPressed: () {
                        navigateToScreen(OperationReport());
                      },
                    ),
                    CustomCard(
                      title: 'Birth Report',
                      onPressed: () {
                        navigateToScreen(BirthReportScreen());
                      },
                    ),
                    CustomCard(
                      title: 'Diagnosis Report',
                      onPressed: () {
                        navigateToScreen(DiagnosisReportScreen());
                      },
                    ),
                    CustomCard(
                      title: 'Death Report',
                      onPressed: () {
                        navigateToScreen(DeathReportScreen());
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToScreen(Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  CustomCard({required this.title, required this.onPressed});

  static const Map<String, IconData> titleToIcon = {
    'Department': Icons.business,
    'Appointment': Icons.calendar_today,
    'Transaction': Icons.attach_money,
    'Bed Status': Icons.hotel,
    'Blood Bank': Icons.local_hospital,
    'Medicine Status': Icons.medical_services,
    'Operation Report': Icons.report,
    'Birth Report': Icons.child_friendly,
    'Diagnosis Report': Icons.healing,
    'Death Report': Icons.mood_bad,
  };

  @override
  Widget build(BuildContext context) {
    IconData? icon = titleToIcon[title];

    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color(0xFF286689), // Convert RGB to Flutter color code
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
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
              icon ?? Icons.business,
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
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                textStyle: MaterialStateProperty.all(
                  TextStyle(
                    color:
                        Color(0xFF286689), // Convert RGB to Flutter color code
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
