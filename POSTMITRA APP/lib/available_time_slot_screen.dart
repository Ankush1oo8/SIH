import 'package:flutter/material.dart';
import 'package:login_screen/thank_you_time_slot_screen.dart';

class AvailableTimeSlotScreen extends StatefulWidget {
  @override
  _AvailableTimeSlotScreenState createState() =>
      _AvailableTimeSlotScreenState();
}

class _AvailableTimeSlotScreenState extends State<AvailableTimeSlotScreen> {
  // Replace this with Firebase Firestore collection in the future
  // final CollectionReference timeSlotCollection =
  // FirebaseFirestore.instance.collection('timeSlots');

  // Temporary hardcoded data (replace with data from Firestore)
  List<Map<String, dynamic>> timeSlots = [
    {'id': '1', 'time': '10:00-11:00am', 'vacant': 3},
    {'id': '2', 'time': '11:00-12:00pm', 'vacant': 2},
    {'id': '3', 'time': '12:00-1:00pm', 'vacant': 7},
    {'id': '4', 'time': '1:00-2:00pm', 'vacant': 0},
    {'id': '5', 'time': '2:00-3:00pm', 'vacant': 5},
  ];

  // Replace this function with Firestore fetch logic in the future
  Future<void> fetchTimeSlots() async {
    // Simulate fetching data (remove when Firebase is added)
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      // Normally, you'd update `timeSlots` here with Firestore data
    });
  }

  // Replace this function with Firestore update logic in the future
  Future<void> updateVacantEntry(String id, int vacant) async {
    setState(() {
      // Update the hardcoded list for now (replace with Firestore logic)
      for (var slot in timeSlots) {
        if (slot['id'] == id) {
          slot['vacant'] = vacant;
          break;
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    fetchTimeSlots(); // Fetch data (replace logic with Firestore in the future)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      appBar: AppBar(
        backgroundColor: Colors.red.shade300,
        title: Text('Available Time Slot'),
      ),
      body: timeSlots.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: timeSlots.length,
          itemBuilder: (context, index) {
            final slot = timeSlots[index];
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                title: Text(slot['time']),
                trailing: Text(
                  'Vacant entry - ${slot['vacant']}',
                  style: TextStyle(
                    color:
                    slot['vacant'] == 0 ? Colors.red : Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: slot['vacant'] > 0
                    ? () {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text('Confirm Slot'),
                      content: Text(
                          'Do you want to select the ${slot['time']} slot?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(ctx),
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            updateVacantEntry(slot['id'], slot['vacant'] - 1);
                            Navigator.pop(ctx); // Close the dialog

                            // Navigate to the Thank You screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ThankYouTimeSlotScreen(
                                  selectedTimeSlot: slot['time'],
                                ),
                              ),
                            );
                          },
                          child: Text('Confirm'),
                        ),
                      ],
                    ),
                  );
                }
                    : null,
              ),
            );
          },
        ),
      ),
    );
  }
}
