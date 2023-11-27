import 'package:flutter/material.dart';

class ShowAppointmentScreen extends StatefulWidget {
  const ShowAppointmentScreen({Key? key});

  @override
  _ShowAppointmentScreenState createState() => _ShowAppointmentScreenState();
}

class _ShowAppointmentScreenState extends State<ShowAppointmentScreen> {
  String selectedDoctor = 'Dr. John Doe';
  String selectedDate = 'November 15, 2023';
  String selectedTime = '10:30 AM';
  String selectedLocation = 'Medical Clinic';
  String selectedPurpose = 'Regular Checkup';

  final doctorOptions = [
    'Dr. John Doe',
    'Dr. Jane Smith',
    'Dr. Michael Johnson',
    'Dr. Sarah Davis',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Appointments'),
        backgroundColor: Color.fromARGB(255, 13, 56, 71),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Select Doctor:',
                  style: TextStyle(fontSize: 18.0, color: Colors.black),
                ),
                PopupMenuButton<String>(
                  initialValue: selectedDoctor,
                  onSelected: (newDoctor) {
                    setState(() {
                      selectedDoctor = newDoctor;
                    });
                  },
                  itemBuilder: (BuildContext context) {
                    return doctorOptions.map((String doctor) {
                      return PopupMenuItem<String>(
                        value: doctor,
                        child: Text(doctor,
                            style: TextStyle(
                                color:
                                    const Color.fromARGB(255, 249, 248, 248))),
                      );
                    }).toList();
                  },
                  child: TextFormField(
                    initialValue: selectedDoctor,
                    enabled: false,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Date:',
                  style: TextStyle(fontSize: 18.0, color: Colors.black),
                ),
                TextFormField(
                  initialValue: selectedDate,
                  onChanged: (newDate) {
                    setState(() {
                      selectedDate = newDate;
                    });
                  },
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Time:',
                  style: TextStyle(fontSize: 18.0, color: Colors.black),
                ),
                TextFormField(
                  initialValue: selectedTime,
                  onChanged: (newTime) {
                    setState(() {
                      selectedTime = newTime;
                    });
                  },
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Location:',
                  style: TextStyle(fontSize: 18.0, color: Colors.black),
                ),
                TextFormField(
                  initialValue: selectedLocation,
                  onChanged: (newLocation) {
                    setState(() {
                      selectedLocation = newLocation;
                    });
                  },
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Purpose:',
                  style: TextStyle(fontSize: 18.0, color: Colors.black),
                ),
                TextFormField(
                  initialValue: selectedPurpose,
                  onChanged: (newPurpose) {
                    setState(() {
                      selectedPurpose = newPurpose;
                    });
                  },
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Implement appointment scheduling logic here
                  },
                  child: Text('Schedule Appointment'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 13, 56, 71),
                    ), // Change the color here
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
