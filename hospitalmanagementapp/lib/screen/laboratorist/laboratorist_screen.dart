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
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text('Laboratorist Dashboard'),
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
                                builder: (context) =>
                                    LaboratoristPrescription()));
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
                                builder: (context) =>
                                    LaboratoristReportFiles()));
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
}

class CustomCard extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  CustomCard({required this.title, required this.onPressed});

  // Define a static map for title to icon
  static const Map<String, IconData> titleToIcon = {
    'Profile': Icons.person,
    'Prescription list': Icons.description,
    'Diagnostic report': Icons.report,
    'Report files': Icons.file_copy,
  };

  @override
  Widget build(BuildContext context) {
    IconData? icon = titleToIcon[title]; // Access the map using the class name

    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color(0xFF286689),
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
                    color: Color(0xFF286689),
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
