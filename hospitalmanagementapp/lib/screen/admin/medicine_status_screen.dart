import 'package:flutter/material.dart';

class MedicineStatus extends StatefulWidget {
  @override
  _MedicineStatusState createState() => _MedicineStatusState();
}

class _MedicineStatusState extends State<MedicineStatus> {
  List<Map<String, dynamic>> medicineList = [
    {'name': 'Amoxicillin', 'quantity': 10},
    {'name': 'Antihistamines', 'quantity': 15},
    {'name': 'Antibiotics', 'quantity': 20},
  ];

  TextEditingController newMedicineController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Medicine Status'),
        backgroundColor: Color.fromARGB(255, 13, 56, 71),
      ),
      body: ListView.builder(
        itemCount: medicineList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
              medicineList[index]['name'],
              style: TextStyle(color: Colors.black),
            ),
            subtitle: Text(
              'Quantity: ${medicineList[index]['quantity']}',
              style: TextStyle(color: Colors.black),
            ),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                _showUpdateDialog(index);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddMedicineDialog();
        },
        child: Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 29, 47, 58),
      ),
    );
  }

  void _showUpdateDialog(int index) {
    TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Update Quantity', style: TextStyle(color: Colors.white)),
          content: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Enter new quantity',
              hintStyle: TextStyle(color: Colors.white),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Update', style: TextStyle(color: Colors.white)),
              onPressed: () {
                setState(() {
                  medicineList[index]['quantity'] = int.parse(controller.text);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
          backgroundColor: Colors.lightBlue,
        );
      },
    );
  }

  void _showAddMedicineDialog() {
    TextEditingController nameController = TextEditingController();
    TextEditingController quantityController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:
              Text('Add New Medicine', style: TextStyle(color: Colors.white)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Medicine Name',
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
              TextField(
                controller: quantityController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Quantity',
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Add', style: TextStyle(color: Colors.white)),
              onPressed: () {
                String name = nameController.text;
                int quantity = int.parse(quantityController.text);
                setState(() {
                  medicineList.add({'name': name, 'quantity': quantity});
                });
                Navigator.of(context).pop();
              },
            ),
          ],
          backgroundColor: Colors.lightBlue,
        );
      },
    );
  }
}
