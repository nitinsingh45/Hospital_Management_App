import 'package:flutter/material.dart';

class UserOperationHistory extends StatefulWidget {
  const UserOperationHistory({Key? key}) : super(key: key);

  @override
  _UserOperationHistoryState createState() => _UserOperationHistoryState();
}

class _UserOperationHistoryState extends State<UserOperationHistory> {
  // Sample operation history data
  List<Operation> operationHistory = [
    Operation('Appendectomy', '2023-01-01', 'Appendectomy report details...'),
    Operation('Knee Surgery', '2023-02-15', 'Knee Surgery report details...'),
    Operation('Gallbladder Removal', '2023-03-10',
        'Gallbladder Removal report details...'),
    // Add more operations as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Operation History'),
        backgroundColor: Color.fromARGB(255, 13, 56, 71),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: operationHistory.length,
          itemBuilder: (context, index) {
            return Card(
              color: const Color.fromARGB(255, 255, 255, 255),
              elevation: 5.0,
              margin: EdgeInsets.symmetric(vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: ListTile(
                title: Text(
                  operationHistory[index].operationName +
                      ' - ' +
                      operationHistory[index].date,
                  style: TextStyle(fontSize: 18.0, color: Colors.black),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.description),
                  onPressed: () {
                    _showReportDialog(operationHistory[index].reportDetails);
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showReportDialog(String reportDetails) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Operation Report'),
          content: Text(reportDetails),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

class Operation {
  final String operationName;
  final String date;
  final String reportDetails;

  Operation(this.operationName, this.date, this.reportDetails);
}
