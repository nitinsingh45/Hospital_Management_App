import 'package:flutter/material.dart';

class DepartmentScreen extends StatefulWidget {
  @override
  _DepartmentScreenState createState() => _DepartmentScreenState();
}

class _DepartmentScreenState extends State<DepartmentScreen> {
  List<Doctor> doctors = [];
  int nextId = 1;

  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();

  Future<void> addDoctor() async {
    // Implement the logic to add a doctor with custom ID, name, and department
    await Future.delayed(Duration(seconds: 1)); // Simulate an async operation

    setState(() {
      int id = int.tryParse(idController.text) ?? nextId;
      String name = nameController.text;
      String department = departmentController.text;

      doctors.add(Doctor(id: id, name: name, department: department));
      nextId = id + 1;

      // Clear the text fields after adding a doctor
      idController.clear();
      nameController.clear();
      departmentController.clear();
    });
  }

  Future<void> deleteDoctor(int id) async {
    // Implement the logic to delete a doctor
    await Future.delayed(Duration(seconds: 1)); // Simulate an async operation

    setState(() {
      doctors.removeWhere((doctor) => doctor.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Department'),
        backgroundColor: Color.fromARGB(255, 13, 56, 71),
      ),
      body: ListView(
        children: doctors.map((doctor) {
          return Card(
            child: ListTile(
              title: Text('ID: ${doctor.id}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: ${doctor.name}'),
                  Text('Department: ${doctor.department}'),
                ],
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  deleteDoctor(doctor.id);
                },
              ),
            ),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Add a New Doctor'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      controller: idController,
                      decoration: InputDecoration(
                        labelText: 'ID',
                        labelStyle: TextStyle(
                            color: Colors
                                .blue), // Set the label text color to blue
                        hintStyle: TextStyle(
                            color: Colors
                                .white), // Set the hint (input text) color to white
                      ),
                      style: TextStyle(
                          color: Colors
                              .white), // Set the entered text color to white
                    ),
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle: TextStyle(
                            color: Colors
                                .blue), // Set the label text color to blue
                        hintStyle: TextStyle(
                            color: Colors
                                .white), // Set the hint (input text) color to white
                      ),
                      style: TextStyle(
                          color: Colors
                              .white), // Set the entered text color to white
                    ),
                    TextField(
                      controller: departmentController,
                      decoration: InputDecoration(
                        labelText: 'Department',
                        labelStyle: TextStyle(
                            color: Colors
                                .blue), // Set the label text color to blue
                        hintStyle: TextStyle(
                            color: Colors
                                .white), // Set the hint (input text) color to white
                      ),
                      style: TextStyle(
                          color: Colors
                              .white), // Set the entered text color to white
                    )
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text('Add'),
                    onPressed: () {
                      Navigator.of(context).pop();
                      addDoctor(); // Note: No 'await' here, it's added in the addDoctor function
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class Doctor {
  final int id;
  final String name;
  final String department;

  Doctor({
    required this.id,
    required this.name,
    required this.department,
  });
}
