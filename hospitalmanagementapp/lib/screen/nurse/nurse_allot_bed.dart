import 'package:flutter/material.dart';

class NurseAllotBed extends StatefulWidget {
  const NurseAllotBed({Key? key}) : super(key: key);

  @override
  State<NurseAllotBed> createState() => _NurseAllotBedState();
}

class _NurseAllotBedState extends State<NurseAllotBed> {
  List<bool> _bedStatus = List.generate(10, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Allot Bed'),
        backgroundColor: Colors.lightBlue,
      ),
      body: ListView.builder(
        itemCount: _bedStatus.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              tileColor: _bedStatus[index]
                  ? Color.fromARGB(255, 169, 66, 77)
                  : Colors.green[100],
              title: Text(
                'Bed ${index + 1}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              subtitle: _bedStatus[index]
                  ? Text(
                      'Occupied',
                      style: TextStyle(color: Colors.red),
                    )
                  : Text(
                      'Free',
                      style: TextStyle(color: Colors.green),
                    ),
              trailing: _bedStatus[index]
                  ? IconButton(
                      icon: Icon(Icons.check, color: Colors.green),
                      onPressed: () {
                        _freeUpBed(index);
                      },
                    )
                  : IconButton(
                      icon: Icon(Icons.bed, color: Colors.blue),
                      onPressed: () {
                        _allotBed(index);
                      },
                    ),
            ),
          );
        },
      ),
    );
  }

  void _allotBed(int index) {
    setState(() {
      _bedStatus[index] = true;
    });
  }

  void _freeUpBed(int index) {
    setState(() {
      _bedStatus[index] = false;
    });
  }
}
