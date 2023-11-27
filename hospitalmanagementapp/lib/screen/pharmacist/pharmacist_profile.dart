import 'package:flutter/material.dart';

class PharmacistProfile extends StatefulWidget {
  const PharmacistProfile({Key? key}) : super(key: key);

  @override
  _PharmacistProfileState createState() => _PharmacistProfileState();
}

class _PharmacistProfileState extends State<PharmacistProfile> {
  String name = 'Pharmacist';
  String degree = 'doctor of pharmacy (Pharm. D.)';
  String profileImage =
      'images/user_profile_image.jpg'; // Default profile image

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color.fromARGB(255, 13, 56, 71),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EditProfile(
                  name: name,
                  degree: degree,
                  profileImage: profileImage,
                  onUpdate: (newName, newDegree, newProfileImage) {
                    setState(() {
                      name = newName;
                      degree = newDegree;
                      profileImage = newProfileImage;
                    });
                    Navigator.pop(context); // Close the edit profile screen
                  },
                ),
              ));
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            color: const Color.fromARGB(255, 232, 232, 232),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 80.0,
                    backgroundImage: AssetImage(profileImage),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Divider(),
                  Center(
                    child: Text(
                      'Degree:',
                      style: TextStyle(fontSize: 24.0, color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Center(
                    child: Text(
                      degree,
                      style: TextStyle(fontSize: 24.0, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EditProfile extends StatefulWidget {
  final String name;
  final String degree;
  final String profileImage;
  final Function onUpdate;

  EditProfile({
    required this.name,
    required this.degree,
    required this.profileImage,
    required this.onUpdate,
  });

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController degreeController = TextEditingController();
  String profileImage = '';

  @override
  void initState() {
    nameController.text = widget.name;
    degreeController.text = widget.degree;
    profileImage = widget.profileImage;
    super.initState();
  }

  Future<void> _pickProfileImage() async {
    // Implement image selection logic here, you can use packages like image_picker
    // and update the 'profileImage' variable with the new image path.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Edit Profile'),
        backgroundColor: Color.fromARGB(255, 13, 56, 71),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  _pickProfileImage();
                },
                child: CircleAvatar(
                  radius: 80.0,
                  backgroundImage: AssetImage(profileImage),
                ),
              ),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: degreeController,
                decoration: InputDecoration(
                  labelText: 'Degree',
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Call the onUpdate callback to update the profile information
                  widget.onUpdate(
                    nameController.text,
                    degreeController.text,
                    profileImage,
                  );
                },
                child: Text('Update Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
