import 'package:flutter/material.dart';

class PharmacistMedicineCategories extends StatefulWidget {
  const PharmacistMedicineCategories({Key? key}) : super(key: key);

  @override
  State<PharmacistMedicineCategories> createState() =>
      _PharmacistMedicineCategoriesState();
}

class _PharmacistMedicineCategoriesState
    extends State<PharmacistMedicineCategories> {
  List<Map<String, dynamic>> _medicineCategories = [
    {
      'name': 'Painkillers',
      'description': 'Medicines for pain relief',
      'medicines': ['Paracetamol', 'Ibuprofen', 'Aspirin']
    },
    {
      'name': 'Antibiotics',
      'description': 'Medicines to fight infections',
      'medicines': ['Amoxicillin', 'Ciprofloxacin', 'Azithromycin']
    },
    {
      'name': 'Vitamins',
      'description': 'Supplements for nutritional support',
      'medicines': ['Vitamin C', 'Vitamin D', 'Multivitamin']
    },
    // Add more categories as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Medicine Categories'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Medicine Categories:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _medicineCategories.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text(_medicineCategories[index]['name']),
                          subtitle: Text(
                              'Description: ${_medicineCategories[index]['description']}'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Medicines: ${_medicineCategories[index]['medicines'].join(', ')}',
                          ),
                        ),
                      ],
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
}
