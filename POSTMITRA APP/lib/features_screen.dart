import 'package:flutter/material.dart';
import 'package:login_screen/send_parcel_screen.dart';
import 'package:login_screen/upcoming_delivery_screen.dart';
import 'find_pincode_screen.dart'; // Import the Find Pincode screen


class FeaturesScreen extends StatelessWidget {
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
              SizedBox(height: 30),
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
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 3,
                children: [
                  featureButton(context, 'Nearest Post', Icons.location_on),
                  featureButton(context, 'Find Pincode', Icons.pin_drop),
                  featureButton(context, 'Update Order', Icons.edit),
                  featureButton(context, 'Send Parcel', Icons.calculate),
                ],
              ),
              SizedBox(height: 30),
              Text(
                'Your Upcoming Delivery',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red.shade400,
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  // Navigate to the UpcomingDeliveryScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UpcomingDeliveryScreen()),
                  );
                },
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.local_shipping, color: Colors.redAccent),
                    title: Text('MM09132005'),
                    subtitle: Text('Processed at India post office (413003)'),
                    trailing: Text('2 Hrs'),
                  ),
                ),
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
        if (label == 'Find Pincode') {
          // Navigate to the Find Pincode screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FindPincodeScreen()),
          );
        } else if(label == 'Update Order') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UpcomingDeliveryScreen()),
          );
        }else if(label == 'Send Parcel') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SendParcelScreen()),
          );
        }else {
          // Placeholder for other features
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('$label feature coming soon!'),
            ),
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
