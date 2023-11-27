import 'package:flutter/material.dart';

class UserAdmitHistory extends StatefulWidget {
  const UserAdmitHistory({Key? key}) : super(key: key);

  @override
  State<UserAdmitHistory> createState() => _UserAdmitHistoryState();
}

class _UserAdmitHistoryState extends State<UserAdmitHistory> {
  // Sample admit history data
  List<AdmitEntry> admitHistory = [
    AdmitEntry('2023-01-01', 'Reason: Fever'),
    AdmitEntry('2023-02-15', 'Reason: Abdominal Pain'),
    AdmitEntry('2023-03-10', 'Reason: Chest Pain'),
    // Add more admit entries as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Admit History'),
        backgroundColor: Color.fromARGB(255, 13, 56, 71),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: admitHistory.length,
          itemBuilder: (context, index) {
            return AdmitHistoryItem(entry: admitHistory[index]);
          },
        ),
      ),
    );
  }
}

class AdmitHistoryItem extends StatelessWidget {
  final AdmitEntry entry;

  const AdmitHistoryItem({Key? key, required this.entry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      color: Colors.white,
      child: ListTile(
        title: Text(
          'Admitted on ${entry.admitDate}',
          style: TextStyle(
              fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        subtitle: Text(
          entry.admitReason,
          style: TextStyle(color: Colors.grey[700]),
        ),
        // You can customize the ListTile further or add more details as needed
      ),
    );
  }
}

class AdmitEntry {
  final String admitDate;
  final String admitReason;

  AdmitEntry(this.admitDate, this.admitReason);
}
