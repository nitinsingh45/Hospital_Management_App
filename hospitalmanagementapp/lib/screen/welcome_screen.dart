import 'package:flutter/material.dart';
import 'package:hospitalmanagementapp/screen/login_screen.dart';
import 'package:hospitalmanagementapp/screen/registration_screen.dart';
//import 'package:dropdown_button2/dropdown_button2.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String? Selectone;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Image.asset('images/logo.png'),
                    height: 120.0,
                  ),
                  Text(
                    'Hospital Management',
                    style: TextStyle(
                      color: Color(0xFF0D3847),
                      fontSize: 25.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 48.0,
            ),

            // Drop down menu
            DropdownButton<String>(
              value: Selectone,
              hint: Center(
                child: Text(
                  'Select One',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              items: <String>[
                'Select One',
                'Admin',
                'User',
                'Doctor',
                'Nurse',
                'Pharmacist',
                'Laboratorist',
                'Accountant'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Center(
                    child: Text(
                      value,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  Selectone = newValue;
                });
              },
              isExpanded: true,
              dropdownColor: Colors.white,
            ),

            SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Material(
                elevation: 5.0,
                color: Color.fromARGB(255, 18, 112, 156),
                borderRadius: BorderRadius.circular(20.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                  minWidth: 120.0,
                  height: 42.0,
                  child: Text(
                    'Log In',
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Material(
                color: Color.fromARGB(255, 50, 79, 130),
                borderRadius: BorderRadius.circular(20.0),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegistrationScreen(),
                      ),
                    );
                  },
                  minWidth: 120.0,
                  height: 42.0,
                  child: Text(
                    'Register',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
