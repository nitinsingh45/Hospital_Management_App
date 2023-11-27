import 'package:flutter/material.dart';

class PharmacistMaintainMedicine extends StatefulWidget {
  const PharmacistMaintainMedicine({Key? key}) : super(key: key);

  @override
  State<PharmacistMaintainMedicine> createState() =>
      _PharmacistMaintainMedicineState();
}

class _PharmacistMaintainMedicineState
    extends State<PharmacistMaintainMedicine> {
  final TextEditingController _medicineNameController = TextEditingController();
  final TextEditingController _medicineQuantityController =
      TextEditingController();
  final TextEditingController _medicinePriceController =
      TextEditingController();

  List<Map<String, dynamic>> _medicines = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Maintain Medicine'),
        backgroundColor: Color.fromARGB(255, 13, 56, 71),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _medicineNameController,
              decoration: InputDecoration(labelText: 'Medicine Name'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _medicineQuantityController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Quantity'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _medicinePriceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Price'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _addMedicine();
              },
              child: Text('Add Medicine'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 33, 59, 83)),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _medicines.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(_medicines[index]['name']),
                      subtitle: Text(
                          'Quantity: ${_medicines[index]['quantity']}, Price: ${_medicines[index]['price']}'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addMedicine() {
    String name = _medicineNameController.text;
    String quantity = _medicineQuantityController.text;
    String price = _medicinePriceController.text;

    if (name.isNotEmpty && quantity.isNotEmpty && price.isNotEmpty) {
      setState(() {
        _medicines.add({
          'name': name,
          'quantity': quantity,
          'price': price,
        });
      });

      _clearFields();
    } else {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill in all fields.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void _clearFields() {
    _medicineNameController.clear();
    _medicineQuantityController.clear();
    _medicinePriceController.clear();
  }
}
