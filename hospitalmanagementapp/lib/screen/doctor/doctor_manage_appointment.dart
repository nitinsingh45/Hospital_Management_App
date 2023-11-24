import 'package:flutter/material.dart';

class DoctorManageAppointment extends StatefulWidget {
  const DoctorManageAppointment({Key? key}) : super(key: key);

  @override
  _DoctorManageAppointmentState createState() =>
      _DoctorManageAppointmentState();
}

class Appointment {
  final String patientName;
  final DateTime appointmentTime;

  Appointment({required this.patientName, required this.appointmentTime});
}

class _DoctorManageAppointmentState extends State<DoctorManageAppointment> {
  List<Appointment> appointments = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Manage Appointment'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Appointments:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: appointments.length,
                itemBuilder: (context, index) {
                  return _buildAppointmentCard(appointments[index]);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddAppointmentDialog(context);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.lightBlue,
      ),
    );
  }

  Widget _buildAppointmentCard(Appointment appointment) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(appointment.patientName),
        subtitle: Text(
          'Appointment Time: ${appointment.appointmentTime}',
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            setState(() {
              appointments.remove(appointment);
            });
          },
        ),
      ),
    );
  }

  Future<void> _showAddAppointmentDialog(BuildContext context) async {
    TextEditingController patientNameController = TextEditingController();
    DateTime selectedDate = DateTime.now();

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Appointment'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: patientNameController,
                decoration: InputDecoration(labelText: 'Patient Name'),
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2101),
                  );

                  if (pickedDate != null && pickedDate != selectedDate) {
                    setState(() {
                      selectedDate = pickedDate;
                    });
                  }
                },
                child: Text('Select Appointment Time'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (patientNameController.text.isNotEmpty) {
                  setState(() {
                    appointments.add(
                      Appointment(
                        patientName: patientNameController.text,
                        appointmentTime: selectedDate,
                      ),
                    );
                  });
                  Navigator.of(context).pop();
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
