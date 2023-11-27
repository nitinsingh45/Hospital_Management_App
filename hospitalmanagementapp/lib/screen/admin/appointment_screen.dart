import 'package:flutter/material.dart';

class AppointmentScreen extends StatefulWidget {
  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  List<Map<String, String>> appointments = [];
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  void addAppointment(String name, String age, String date) {
    setState(() {
      final appointment = {
        'name': name,
        'age': age,
        'date': date,
      };
      appointments.add(appointment);
      nameController.clear();
      ageController.clear();
      dateController.clear();
    });
  }

  void cancelAppointment(int index) {
    setState(() {
      appointments.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text('Appointments'),
        backgroundColor: Color.fromARGB(255, 13, 56, 71),
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: const Color.fromARGB(255, 52, 53, 54),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: nameController,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: ageController,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Age',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: dateController,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Date',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 49, 82, 108)),
                  ),
                  onPressed: () {
                    final name = nameController.text;
                    final age = ageController.text;
                    final date = dateController.text;
                    if (name.isNotEmpty && age.isNotEmpty && date.isNotEmpty) {
                      addAppointment(name, age, date);
                    }
                  },
                  child: Text('Add Appointment',
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: appointments.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 3,
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(
                      'Name: ${appointments[index]['name']}',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    subtitle: Text(
                      'Age: ${appointments[index]['age']}, Date: ${appointments[index]['date']}',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.cancel),
                      onPressed: () {
                        cancelAppointment(index);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
