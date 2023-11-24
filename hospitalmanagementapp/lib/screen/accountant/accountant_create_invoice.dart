// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

class Invoice {
  final String patientName;
  final String admissionDate;
  final String dischargeDate;
  final double totalAmount;

  Invoice({
    required this.patientName,
    required this.admissionDate,
    required this.dischargeDate,
    required this.totalAmount,
  });
}

class AccountantCreateInvoice extends StatefulWidget {
  const AccountantCreateInvoice({Key? key}) : super(key: key);

  @override
  State<AccountantCreateInvoice> createState() =>
      _AccountantCreateInvoiceState();
}

class _AccountantCreateInvoiceState extends State<AccountantCreateInvoice> {
  final TextEditingController patientNameController = TextEditingController();
  final TextEditingController admissionDateController = TextEditingController();
  final TextEditingController dischargeDateController = TextEditingController();
  final TextEditingController totalAmountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Create Invoice"),
        backgroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: patientNameController,
              decoration: InputDecoration(labelText: 'Patient Name'),
            ),
            TextField(
              controller: admissionDateController,
              decoration: InputDecoration(labelText: 'Admission Date'),
            ),
            TextField(
              controller: dischargeDateController,
              decoration: InputDecoration(labelText: 'Discharge Date'),
            ),
            TextField(
              controller: totalAmountController,
              decoration: InputDecoration(labelText: 'Total Amount'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _createInvoice();
              },
              child: Text('Create Invoice'),
            ),
          ],
        ),
      ),
    );
  }

  void _createInvoice() {
    if (patientNameController.text.isNotEmpty &&
        admissionDateController.text.isNotEmpty &&
        dischargeDateController.text.isNotEmpty &&
        totalAmountController.text.isNotEmpty) {
      // Assuming that the total amount is a valid double value
      double totalAmount = double.parse(totalAmountController.text);

      Invoice invoice = Invoice(
        patientName: patientNameController.text,
        admissionDate: admissionDateController.text,
        dischargeDate: dischargeDateController.text,
        totalAmount: totalAmount,
      );

      // TODO: Handle the created invoice, e.g., save it to a database or perform further actions

      // Clear the text controllers
      patientNameController.clear();
      admissionDateController.clear();
      dischargeDateController.clear();
      totalAmountController.clear();

      // Optionally, you can show a success message or navigate to another screen
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invoice created successfully!'),
        ),
      );
    } else {
      // Show an error message or handle the case where not all fields are filled
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill in all fields.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
