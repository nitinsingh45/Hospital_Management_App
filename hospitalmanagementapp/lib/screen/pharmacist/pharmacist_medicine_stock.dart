import 'package:flutter/material.dart';

class PharmacistMedicineStock extends StatefulWidget {
  const PharmacistMedicineStock({Key? key}) : super(key: key);

  @override
  State<PharmacistMedicineStock> createState() =>
      _PharmacistMedicineStockState();
}

class _PharmacistMedicineStockState extends State<PharmacistMedicineStock> {
  List<Map<String, dynamic>> _medicineStock = [
    {'name': 'Medicine A', 'stock': 100},
    {'name': 'Medicine B', 'stock': 50},
    {'name': 'Medicine C', 'stock': 75},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Medicine Stock'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Current Medicine Stock:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _medicineStock.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(_medicineStock[index]['name']),
                      subtitle:
                          Text('Stock: ${_medicineStock[index]['stock']}'),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _updateStock();
              },
              child: Text('Update Stock'),
            ),
          ],
        ),
      ),
    );
  }

  void _updateStock() {
    // You can implement logic to update the stock here
    // For simplicity, let's just increase the stock of the first medicine by 10
    setState(() {
      _medicineStock[0]['stock'] += 10;
    });

    // You can add additional logic to update the stock in your database or backend
    // For example, you might want to make an API call to update the stock on the server
  }
}
