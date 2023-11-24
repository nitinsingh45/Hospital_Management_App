import 'package:flutter/material.dart';

class AccountantTakeCash extends StatefulWidget {
  const AccountantTakeCash({Key? key}) : super(key: key);

  @override
  State<AccountantTakeCash> createState() => _AccountantTakeCashState();
}

class _AccountantTakeCashState extends State<AccountantTakeCash> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _cashController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Take Cash'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Patient Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the patient\'s name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _mobileController,
                decoration: InputDecoration(labelText: 'Mobile Number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the mobile number';
                  }

                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _cashController,
                decoration: InputDecoration(labelText: 'Cash Amount'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the cash amount';
                  }

                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Save the data or perform necessary actions

                    _saveData();
                  }
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveData() {
    // Replace this with your logic to save the data
    String name = _nameController.text;
    String mobile = _mobileController.text;
    double cashAmount = double.parse(_cashController.text);

    // You can perform further actions with the collected data
    print('Name: $name, Mobile: $mobile, Cash Amount: $cashAmount');

    // Clear the form after saving data
    _formKey.currentState?.reset();
  }
}
