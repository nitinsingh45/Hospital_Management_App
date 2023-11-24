import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String name = 'Joy';
  int age = 30;
  String bloodGroup = 'O+';
  String height = '175 cm';
  String weight = '70 kg';
  String profileImage =
      'images/user_profile_image.jpg'; // Default profile image

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.lightBlue,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EditProfile(
                  name: name,
                  age: age,
                  bloodGroup: bloodGroup,
                  height: height,
                  weight: weight,
                  profileImage: profileImage,
                  onUpdate: (newName, newAge, newBloodGroup, newHeight,
                      newWeight, newProfileImage) {
                    setState(() {
                      name = newName;
                      age = newAge;
                      bloodGroup = newBloodGroup;
                      height = newHeight;
                      weight = newWeight;
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
                  Divider(),
                  ListTile(
                    title: Text(
                      'Age:',
                      style: TextStyle(fontSize: 18.0, color: Colors.black),
                    ),
                    subtitle: Text(
                      age.toString(),
                      style: TextStyle(fontSize: 18.0, color: Colors.black),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Blood Group:',
                      style: TextStyle(fontSize: 18.0, color: Colors.black),
                    ),
                    subtitle: Text(
                      bloodGroup,
                      style: TextStyle(fontSize: 18.0, color: Colors.black),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Height:',
                      style: TextStyle(fontSize: 18.0, color: Colors.black),
                    ),
                    subtitle: Text(
                      height,
                      style: TextStyle(fontSize: 18.0, color: Colors.black),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Weight:',
                      style: TextStyle(fontSize: 18.0, color: Colors.black),
                    ),
                    subtitle: Text(
                      weight,
                      style: TextStyle(fontSize: 18.0, color: Colors.black),
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
  final int age;
  final String bloodGroup;
  final String height;
  final String weight;
  final String profileImage;
  final Function onUpdate;

  EditProfile({
    required this.name,
    required this.age,
    required this.bloodGroup,
    required this.height,
    required this.weight,
    required this.profileImage,
    required this.onUpdate,
  });

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController bloodGroupController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  String profileImage = '';

  @override
  void initState() {
    nameController.text = widget.name;
    ageController.text = widget.age.toString();
    bloodGroupController.text = widget.bloodGroup;
    heightController.text = widget.height;
    weightController.text = widget.weight;
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
        backgroundColor: Colors.lightBlue,
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
                    labelStyle: TextStyle(color: Colors.white)),
              ),
              TextFormField(
                controller: ageController,
                decoration: InputDecoration(
                    labelText: 'Age',
                    labelStyle: TextStyle(color: Colors.white)),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: bloodGroupController,
                decoration: InputDecoration(
                    labelText: 'Blood Group',
                    labelStyle: TextStyle(color: Colors.white)),
              ),
              TextFormField(
                controller: heightController,
                decoration: InputDecoration(
                    labelText: 'Height',
                    labelStyle: TextStyle(color: Colors.white)),
              ),
              TextFormField(
                controller: weightController,
                decoration: InputDecoration(
                    labelText: 'Weight',
                    labelStyle: TextStyle(color: Colors.white)),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Call the onUpdate callback to update the profile information
                  widget.onUpdate(
                    nameController.text,
                    int.parse(ageController.text),
                    bloodGroupController.text,
                    heightController.text,
                    weightController.text,
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
