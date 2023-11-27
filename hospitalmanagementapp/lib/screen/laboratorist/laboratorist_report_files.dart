import 'package:flutter/material.dart';

class PatientReport {
  final String patientName;
  final String age;
  final String gender;
  final String reportDetails;

  PatientReport({
    required this.patientName,
    required this.age,
    required this.gender,
    required this.reportDetails,
  });
}

class LaboratoristReportFiles extends StatefulWidget {
  const LaboratoristReportFiles({Key? key}) : super(key: key);

  @override
  State<LaboratoristReportFiles> createState() =>
      _LaboratoristReportFilesState();
}

class _LaboratoristReportFilesState extends State<LaboratoristReportFiles> {
  final TextEditingController patientNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController reportDetailsController = TextEditingController();

  List<PatientReport> reportFiles = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Report Files'),
        backgroundColor: Color.fromARGB(255, 13, 56, 71),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: patientNameController,
                decoration: InputDecoration(labelText: 'Patient Name'),
              ),
              TextField(
                controller: ageController,
                decoration: InputDecoration(labelText: 'Age'),
              ),
              TextField(
                controller: genderController,
                decoration: InputDecoration(labelText: 'Gender'),
              ),
              TextField(
                controller: reportDetailsController,
                maxLines: 5,
                decoration: InputDecoration(labelText: 'Report Details'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _createReport();
                },
                child: Text('Create Report'),
              ),
              SizedBox(height: 16),
              if (reportFiles.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(0), // Adjust the padding here
                    itemCount: reportFiles.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 3,
                        margin:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        child: ListTile(
                          title: Text(reportFiles[index].patientName),
                          subtitle: Text(
                              'Age: ${reportFiles[index].age}, Gender: ${reportFiles[index].gender}'),
                          onTap: () {
                            // Handle tapping on a report file
                          },
                        ),
                      );
                    },
                  ),
                )
              else
                Text('No Report Files'),
            ],
          ),
        ),
      ),
    );
  }

  void _createReport() {
    if (patientNameController.text.isNotEmpty &&
        ageController.text.isNotEmpty &&
        genderController.text.isNotEmpty &&
        reportDetailsController.text.isNotEmpty) {
      setState(() {
        reportFiles.add(
          PatientReport(
            patientName: patientNameController.text,
            age: ageController.text,
            gender: genderController.text,
            reportDetails: reportDetailsController.text,
          ),
        );
      });

      // Clear the text controllers
      patientNameController.clear();
      ageController.clear();
      genderController.clear();
      reportDetailsController.clear();
    } else {
      // Show an error message or handle the case where not all fields are filled
    }
  }
}
