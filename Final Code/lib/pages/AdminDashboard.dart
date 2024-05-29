import 'package:flutter/material.dart';
import 'package:project_v1/pages/All_Attendees_Screan.dart';
import 'package:project_v1/pages/All_Events_Screan.dart';
import 'add_event_screen.dart';
import 'delete_event_screen.dart';



class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddEventScreen()),
                );
              },
              child: Text('Add Event'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DeleteEventScreen()),
                );
              },
              child: Text('Delete Event'),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => AddAdminScreen()),
            //     );
            //   },
            //   child: Text('Add Admin'),
            // ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AllEventsScreen()),
                );
              },
              child: Text('All Events'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AllAttendeesScreen()),
                );
              },
              child: Text('All Attendees'),
            ),
          ],
        ),
      ),
    );
  }
}
