import 'package:flutter/material.dart';
import 'package:hospitalmanagementapp/screen/pharmacist/pharmacist_maintain_medicine.dart';
import 'package:hospitalmanagementapp/screen/pharmacist/pharmacist_medication.dart';
import 'package:hospitalmanagementapp/screen/pharmacist/pharmacist_medicine_categories.dart';
import 'package:hospitalmanagementapp/screen/pharmacist/pharmacist_medicine_stock.dart';
import 'package:hospitalmanagementapp/screen/pharmacist/pharmacist_prescription.dart';
import 'package:hospitalmanagementapp/screen/pharmacist/pharmacist_profile.dart';

class PharmacistScreen extends StatefulWidget {
  const PharmacistScreen({super.key});

  @override
  State<PharmacistScreen> createState() => _PharmacistScreenState();
}

class _PharmacistScreenState extends State<PharmacistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
          AppBar(title: Text('Pharmacist'), backgroundColor: Colors.lightBlue),
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
                          builder: (context) => PharmacistProfile()));
                },
              ),
              CustomCard(
                title: 'Maintain medicine',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PharmacistMaintainMedicine()));
                },
              ),
              CustomCard(
                title: 'Medicine stock',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PharmacistMedicineStock()));
                },
              ),
              CustomCard(
                title: 'Medicine categories',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              PharmacistMedicineCategories()));
                },
              ),
              CustomCard(
                title: 'Prescription',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PharmacistPrescription()));
                },
              ),
              CustomCard(
                title: 'Medication',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PharmacistMedication()));
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
    'Maintain medicine': Icons.medical_information_outlined,
    'Medicine stock': Icons.medical_information_sharp,
    'Medicine categories': Icons.category,
    'Prescription': Icons.support,
    'Medication': Icons.medical_services_rounded,
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
