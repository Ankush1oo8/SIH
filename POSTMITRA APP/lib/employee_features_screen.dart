import 'package:flutter/material.dart';
import 'time_slots_screen_employee.dart'; // Import the TimeSlotsScreen file

class EmployeeFeaturesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Features',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.red.shade400,
                ),
              ),
              SizedBox(height: 20),
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 3,
                children: [
                  featureButton(context, 'Time Slots', Icons.location_on),
                  featureButton(context, 'Updated Timeslots', Icons.pin_drop),
                  featureButton(context, 'Customer Contact', Icons.edit),
                  featureButton(context, 'Updated delivery date', Icons.calculate),
                ],
              ),
              SizedBox(height: 30),
              Text(
                'Your Upcoming Deliveries',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red.shade400,
                ),
              ),
              SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.local_shipping, color: Colors.redAccent),
                      title: Text('Delivery Item $index'),
                      subtitle: Text('Processed at sorting facility'),
                      trailing: Text('2 Hrs'),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget featureButton(BuildContext context, String label, IconData icon) {
    return ElevatedButton.icon(
      onPressed: () {
        if (label == 'Time Slots') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TimeSlotsScreen()), // Navigate to TimeSlotsScreen
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('$label feature coming soon!')),
          );
        }
      },
      icon: Icon(icon, size: 20, color: Colors.red),
      label: Text(
        label,
        style: TextStyle(fontSize: 14, color: Colors.black),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        side: BorderSide(color: Colors.redAccent),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 2,
        padding: EdgeInsets.symmetric(vertical: 10),
      ),
    );
  }
}
