import 'package:flutter/material.dart';

class DoctorListScreen extends StatefulWidget {
  const DoctorListScreen({Key? key}) : super(key: key);

  @override
  State<DoctorListScreen> createState() => _DoctorListScreenState();
}

class _DoctorListScreenState extends State<DoctorListScreen> {
  // Dummy data for the list of doctors
  final List<Map<String, String>> doctors = [
    {
      'name': 'Dr. sinchain',
      'department': 'Cardiology',
      'degree': 'MD',
      'sittingTime': '9:00 AM - 5:00 PM',
    },
    {
      'name': 'Dr. Jhetalal',
      'department': 'Pediatrics',
      'degree': 'MD',
      'sittingTime': '10:00 AM - 6:00 PM',
    },
    {
      'name': 'Dr. Sarah Johnson',
      'department': 'Dermatology',
      'degree': 'Dermatologist',
      'sittingTime': '8:30 AM - 4:30 PM',
    },
    {
      'name': 'Dr. doremon',
      'department': 'Dermatology',
      'degree': 'Dermatologist',
      'sittingTime': '8:30 AM - 4:30 PM',
    },
    {
      'name': 'Dr. chota bheem',
      'department': 'Cardiology',
      'degree': 'MBBS',
      'sittingTime': '8:30 AM - 2:30 PM',
    },

    // Add more doctor entries as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Doctor List'),
        backgroundColor: Colors.lightBlue,
      ),
      body: ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          final doctor = doctors[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              tileColor: Color.fromARGB(255, 255, 255, 255),
              title: Text(
                doctor['name'] ?? '',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Department: ${doctor['department']}',
                    style: TextStyle(color: Colors.black),
                  ),
                  Text('Degree: ${doctor['degree']}',
                      style: TextStyle(color: Colors.black)),
                  Text('Sitting Time: ${doctor['sittingTime']}',
                      style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
