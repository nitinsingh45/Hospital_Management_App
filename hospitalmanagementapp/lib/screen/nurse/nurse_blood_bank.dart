import 'package:flutter/material.dart';

class NurseBloodBank extends StatefulWidget {
  const NurseBloodBank({Key? key}) : super(key: key);

  @override
  State<NurseBloodBank> createState() => _NurseBloodBankState();
}

class _NurseBloodBankState extends State<NurseBloodBank> {
  List<BloodGroup> bloodGroups = [
    BloodGroup(type: 'A+', unitsAvailable: 20),
    BloodGroup(type: 'B-', unitsAvailable: 15),
    BloodGroup(type: 'O+', unitsAvailable: 30),
    BloodGroup(type: 'AB+', unitsAvailable: 25),
    BloodGroup(type: 'O-', unitsAvailable: 10),
    // Add more blood groups as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Blood Bank',
            style: TextStyle(color: Colors.black)), // Set text color to black
        backgroundColor: Colors.lightBlue,
      ),
      body: ListView.builder(
        itemCount: bloodGroups.length,
        itemBuilder: (context, index) {
          return BloodGroupTile(bloodGroup: bloodGroups[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddBloodDialog(context);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.lightBlue,
      ),
    );
  }

  // Function to show a dialog for adding or managing blood units
  void _showAddBloodDialog(BuildContext context) {
    TextEditingController bloodTypeController = TextEditingController();
    TextEditingController unitsController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add/Manage Blood Units',
              style: TextStyle(
                  color: const Color.fromARGB(
                      255, 255, 255, 255))), // Set text color to black
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: bloodTypeController,
                decoration: InputDecoration(
                  labelText: 'Blood Type',
                  labelStyle: TextStyle(
                      color: const Color.fromARGB(
                          255, 255, 255, 255)), // Set label text color to black
                ),
              ),
              TextField(
                controller: unitsController,
                decoration: InputDecoration(
                  labelText: 'Units Available',
                  labelStyle: TextStyle(
                      color: const Color.fromARGB(
                          255, 255, 255, 255)), // Set label text color to black
                ),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Add or manage the availability of the selected blood group
                setState(() {
                  final existingGroup = bloodGroups.firstWhere(
                      (group) => group.type == bloodTypeController.text);

                  // ignore: unnecessary_null_comparison
                  if (existingGroup != null) {
                    existingGroup.unitsAvailable =
                        int.tryParse(unitsController.text) ?? 0;
                  } else {
                    bloodGroups.add(
                      BloodGroup(
                        type: bloodTypeController.text,
                        unitsAvailable: int.tryParse(unitsController.text) ?? 0,
                      ),
                    );
                  }
                });
                Navigator.of(context).pop();
              },
              child: Text('Save',
                  style: TextStyle(
                      color: Colors.white)), // Set text color to white
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel',
                  style: TextStyle(
                      color: Colors.white)), // Set text color to white
            ),
          ],
        );
      },
    );
  }
}

class BloodGroup {
  final String type;
  int unitsAvailable;

  BloodGroup({required this.type, required this.unitsAvailable});
}

class BloodGroupTile extends StatelessWidget {
  final BloodGroup bloodGroup;

  BloodGroupTile({required this.bloodGroup});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Blood Type: ${bloodGroup.type}',
          style: TextStyle(color: Colors.black)), // Set text color to black
      subtitle: Text('Units Available: ${bloodGroup.unitsAvailable}',
          style: TextStyle(color: Colors.black)), // Set text color to black
    );
  }
}
