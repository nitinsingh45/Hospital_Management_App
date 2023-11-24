import 'package:flutter/material.dart';

class DoctorOperationReport extends StatefulWidget {
  const DoctorOperationReport({Key? key}) : super(key: key);

  @override
  State<DoctorOperationReport> createState() => _DoctorOperationReportState();
}

class _DoctorOperationReportState extends State<DoctorOperationReport> {
  String operationDetails = '';
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Operation Report'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Patient Operation Details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Operation Details',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  operationDetails = value;
                });
              },
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'Date of Operation: ${selectedDate.toLocal()}'.split(' ')[0],
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: Text('Select Date'),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save operation report logic goes here
                // You can use the values of operationDetails and selectedDate
                // to create and save the operation report
              },
              child: Text('Submit Operation Report'),
            ),
          ],
        ),
      ),
    );
  }
}
