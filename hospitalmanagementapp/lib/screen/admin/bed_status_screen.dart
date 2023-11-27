import 'package:flutter/material.dart';

class BedStatusScreen extends StatefulWidget {
  @override
  _BedStatusScreenState createState() => _BedStatusScreenState();
}

class _BedStatusScreenState extends State<BedStatusScreen> {
  List<Bed> bedStatus = [
    Bed(number: 1, isOccupied: false),
    Bed(number: 2, isOccupied: true),
    Bed(number: 3, isOccupied: false),
    // Add more beds as needed
  ];

  // Create a ScrollController
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose(); // Dispose the ScrollController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Bed Status', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 13, 56, 71),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController, // Assign the ScrollController
              itemCount: bedStatus.length,
              itemBuilder: (context, index) {
                return BedStatusTile(
                  bed: bedStatus[index],
                  onBedStatusChanged: (newStatus) {
                    setState(() {
                      bedStatus[index].isOccupied = newStatus;
                    });
                  },
                  onDelete: () {
                    setState(() {
                      bedStatus.removeAt(index);
                    });
                  },
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 44, 68, 79),
                  onPrimary: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    bedStatus.add(Bed(
                      number: bedStatus.length + 1,
                      isOccupied: false,
                    ));
                    // Scroll to the bottom after adding a new bed
                    _scrollController.animateTo(
                      _scrollController.position.maxScrollExtent,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  });
                },
                child: Text(
                  'Add Bed',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Bed {
  final int number;
  bool isOccupied;

  Bed({required this.number, required this.isOccupied});
}

class BedStatusTile extends StatelessWidget {
  final Bed bed;
  final Function(bool) onBedStatusChanged;
  final VoidCallback onDelete;

  BedStatusTile({
    required this.bed,
    required this.onBedStatusChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Bed ${bed.number}',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      subtitle: Text(
        bed.isOccupied ? 'Occupied' : 'Available',
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: onDelete,
          ),
          Switch(
            value: bed.isOccupied,
            onChanged: (newValue) {
              onBedStatusChanged(newValue);
            },
          ),
        ],
      ),
    );
  }
}
