import 'package:flutter/material.dart';

class ThankYouScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50, // Light background color
      appBar: AppBar(
        backgroundColor: Colors.red.shade300, // AppBar color
        title: Text(
          'Thank You',
          style: TextStyle(color: Colors.white), // AppBar title color
        ),
        centerTitle: true, // Center the AppBar title
        elevation: 0, // Remove shadow
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding around the content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Thank You!',
              style: TextStyle(
                fontSize: 28, // Slightly larger text for the main title
                fontWeight: FontWeight.bold,
                color: Colors.redAccent, // Accent color
              ),
              textAlign: TextAlign.center, // Center-align the text
            ),
            SizedBox(height: 20), // Space between title and message
            Text(
              'Your delivery date has been updated successfully.',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black87, // Slightly softer black for better readability
              ),
              textAlign: TextAlign.center, // Center-align the text
            ),
            SizedBox(height: 30), // Space between message and button
            ElevatedButton(
              onPressed: () {
                // Navigate to the home screen by popping all routes
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade300, // Button background color
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15), // Button size
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded button corners
                ),
              ),
              child: Text(
                'Go to Home',
                style: TextStyle(
                  color: Colors.white, // Button text color
                  fontSize: 16, // Button text size
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
