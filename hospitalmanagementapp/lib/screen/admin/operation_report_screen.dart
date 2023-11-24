import 'package:flutter/material.dart';

class PatientReport {
  String patientName;
  String operationDate;
  String operationDetails;
  String additionalInfo;

  PatientReport({
    required this.patientName,
    required this.operationDate,
    required this.operationDetails,
    required this.additionalInfo,
  });
}

class OperationReport extends StatefulWidget {
  @override
  _OperationReportState createState() => _OperationReportState();
}

class _OperationReportState extends State<OperationReport> {
  List<PatientReport> patientReports = [];

  void _showEditDialog(int index) {
    TextEditingController nameController = TextEditingController(
      text: patientReports[index].patientName,
    );
    TextEditingController dateController = TextEditingController(
      text: patientReports[index].operationDate,
    );
    TextEditingController detailsController = TextEditingController(
      text: patientReports[index].operationDetails,
    );
    TextEditingController infoController = TextEditingController(
      text: patientReports[index].additionalInfo,
    );

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.lightBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Edit Operation Report',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Patient Name',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                TextField(
                  controller: dateController,
                  decoration: InputDecoration(
                    labelText: 'Operation Date',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                TextField(
                  controller: detailsController,
                  decoration: InputDecoration(
                    labelText: 'Operation Details',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                TextField(
                  controller: infoController,
                  decoration: InputDecoration(
                    labelText: 'Additional Information',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          patientReports[index].patientName =
                              nameController.text;
                          patientReports[index].operationDate =
                              dateController.text;
                          patientReports[index].operationDetails =
                              detailsController.text;
                          patientReports[index].additionalInfo =
                              infoController.text;
                        });
                        Navigator.of(context).pop();
                      },
                      child:
                          Text('Save', style: TextStyle(color: Colors.white)),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child:
                          Text('Cancel', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _addReport() {
    TextEditingController nameController = TextEditingController();
    TextEditingController dateController = TextEditingController();
    TextEditingController detailsController = TextEditingController();
    TextEditingController infoController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.lightBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Add Operation Report',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Patient Name',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                TextField(
                  controller: dateController,
                  decoration: InputDecoration(
                    labelText: 'Operation Date',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                TextField(
                  controller: detailsController,
                  decoration: InputDecoration(
                    labelText: 'Operation Details',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                TextField(
                  controller: infoController,
                  decoration: InputDecoration(
                    labelText: 'Additional Information',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          patientReports.add(PatientReport(
                            patientName: nameController.text,
                            operationDate: dateController.text,
                            operationDetails: detailsController.text,
                            additionalInfo: infoController.text,
                          ));
                        });
                        Navigator.of(context).pop();
                      },
                      child: Text('Add', style: TextStyle(color: Colors.white)),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child:
                          Text('Cancel', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Operation Report'),
        backgroundColor: Colors.lightBlue,
      ),
      body: ListView.builder(
        itemCount: patientReports.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4.0,
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              tileColor: Colors.white,
              title: Text(
                'Patient Name: ${patientReports[index].patientName}',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Operation Date: ${patientReports[index].operationDate}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Operation Details: ${patientReports[index].operationDetails}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Additional Information: ${patientReports[index].additionalInfo}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  _showEditDialog(index);
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addReport,
        child: Icon(Icons.add),
        backgroundColor: Colors.lightBlue,
      ),
    );
  }
}
