import 'package:flutter/material.dart';
import 'package:hospitalmanagementapp/screen/accountant/accountant_screen.dart';
import 'package:hospitalmanagementapp/screen/admin/admin_screen.dart';
import 'package:hospitalmanagementapp/screen/doctor/doctor_screen.dart';
import 'package:hospitalmanagementapp/screen/laboratorist/laboratorist_screen.dart';
import 'package:hospitalmanagementapp/screen/nurse/nurse_screen.dart';
import 'package:hospitalmanagementapp/screen/pharmacist/pharmacist_screen.dart';
import 'package:hospitalmanagementapp/screen/user/user_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = "";
  String password = "";
  bool isLoading = false; // Add a loading indicator flag

  // Function to simulate a login process (replace this with your actual login logic)
  Future<void> performLogin() async {
    // Simulate a delay to show loading spinner (remove this in your real implementation)
    await Future.delayed(Duration(seconds: 1));
    // add email and password function later
    if (email == "admin@gmail.com" && password == "admin") {
      // Check if the entered email and password are correct.
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AdminScreen(),
        ),
      );
    } else if (email == "user@gmail.com" && password == "user") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UserScreen(),
        ),
      );
    } else if (email == "doctor@gmail.com" && password == "doctor") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DoctorScreen(),
        ),
      );
    } else if (email == "nurse@gmail.com" && password == "nurse") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NurseScreen(),
        ),
      );
    } else if (email == "pharmacist@gmail.com" && password == "pharmacist") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PharmacistScreen(),
        ),
      );
    } else if (email == "laboratorist@gmail.com" &&
        password == "laboratorist") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LaboratoristScreen(),
        ),
      );
    } else if (email == "accountant@gmail.com" && password == "accountant") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AccountantScreen(),
        ),
      );
    }
  }

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
            Container(
              height: 200.0,
              child: Image.asset('images/logo.png'),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              onChanged: (value) {
                email = value;
              },
              decoration: InputDecoration(
                hintText: 'Enter your email', // Set hint text for email
                hintStyle: TextStyle(color: Colors.grey),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            // ... (other text field code)

            SizedBox(
              height: 8.0,
            ),
            TextField(
              onChanged: (value) {
                password = value;
              },
              decoration: InputDecoration(
                hintText: 'Enter your email', // Set hint text for email
                hintStyle: TextStyle(color: Colors.grey),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            // ... (other text field code)

            SizedBox(
              height: 24.0,
            ),
            // Use a FutureBuilder to handle the login process
            FutureBuilder(
              future: performLogin(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Display a loading spinner while waiting
                  return CircularProgressIndicator();
                } else {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Material(
                      color: Color.fromARGB(255, 18, 112, 156),
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      elevation: 5.0,
                      child: MaterialButton(
                        onPressed: () {
                          // Trigger the login process
                          setState(() {
                            isLoading = true;
                          });
                        },
                        minWidth: 200.0,
                        height: 42.0,
                        child: Text(
                          'Log In',
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
