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
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text('Pharmacist Dashboard'),
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
                                builder: (context) => PharmacistProfile()));
                      },
                    ),
                    CustomCard(
                      title: 'Maintain medicine',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PharmacistMaintainMedicine()));
                      },
                    ),
                    CustomCard(
                      title: 'Medicine stock',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PharmacistMedicineStock()));
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
                                builder: (context) =>
                                    PharmacistPrescription()));
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
    'Create invoice': Icons.description,
    'Take cash': Icons.attach_money,
    'Payment history': Icons.history,
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
                fontSize: 14,
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
