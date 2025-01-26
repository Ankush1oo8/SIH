import 'package:flutter/material.dart';
import 'features_screen.dart'; // Import the Features screen

class ThankYouTimeSlotScreen extends StatelessWidget {
  final String selectedTimeSlot;

  ThankYouTimeSlotScreen({required this.selectedTimeSlot});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Thank You'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Thank You!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Your time slot has been updated.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Selected Time Slot: $selectedTimeSlot',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => FeaturesScreen()),
                      (route) => false, // Remove all previous routes
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                minimumSize: Size(double.infinity, 50),
                shadowColor: Colors.grey.shade500,
                elevation: 5,
              ),
              child: Text(
                'Go to Home',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
