import 'package:flutter/material.dart';

class DiagnosticReport {
  final String patientName;
  final String reportDetails;

  DiagnosticReport({required this.patientName, required this.reportDetails});
}

class LaboratoristDiagnosticReport extends StatefulWidget {
  const LaboratoristDiagnosticReport({Key? key}) : super(key: key);

  @override
  State<LaboratoristDiagnosticReport> createState() =>
      _LaboratoristDiagnosticReportState();
}

class _LaboratoristDiagnosticReportState
    extends State<LaboratoristDiagnosticReport> {
  List<DiagnosticReport> diagnosticReports = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Diagnostic Report'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                _showAddReportDialog(context);
              },
              child: Text('Add Diagnostic Report'),
            ),
            SizedBox(height: 16),
            if (diagnosticReports.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: diagnosticReports.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 3,
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: ListTile(
                        title: Text(diagnosticReports[index].patientName),
                        subtitle: Text(
                            'Details: ${diagnosticReports[index].reportDetails}'),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _showDeleteReportDialog(index);
                          },
                        ),
                      ),
                    );
                  },
                ),
              )
            else
              Text('No Diagnostic Reports'),
          ],
        ),
      ),
    );
  }

  void _showAddReportDialog(BuildContext context) {
    TextEditingController patientNameController = TextEditingController();
    TextEditingController reportDetailsController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Diagnostic Report',
              style: TextStyle(color: Colors.white)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: patientNameController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Patient Name',
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
              TextField(
                controller: reportDetailsController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Report Details',
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text('Cancel', style: TextStyle(color: Colors.white)),
            ),
            ElevatedButton(
              onPressed: () {
                // Add the diagnostic report to the list
                setState(() {
                  diagnosticReports.add(
                    DiagnosticReport(
                      patientName: patientNameController.text,
                      reportDetails: reportDetailsController.text,
                    ),
                  );
                });
                Navigator.pop(context); // Close the dialog
              },
              child: Text('Add Report', style: TextStyle(color: Colors.white)),
            ),
          ],
          backgroundColor:
              Colors.lightBlue, // Set the background color of the dialog
        );
      },
    );
  }

  void _showDeleteReportDialog(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Diagnostic Report'),
          content: Text('Are you sure you want to delete this report?'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Remove the diagnostic report from the list
                setState(() {
                  diagnosticReports.removeAt(index);
                });
                Navigator.pop(context); // Close the dialog
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
