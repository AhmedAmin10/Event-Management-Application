import 'package:flutter/material.dart';
import 'package:project_v1/MySQL_Connection/MySQL.dart';

class AllAttendeesScreen extends StatefulWidget {
  @override
  State<AllAttendeesScreen> createState() => _AllAttendeesScreenState();
}

class _AllAttendeesScreenState extends State<AllAttendeesScreen> {
  List<Map<String, dynamic>> attendees = [];

  @override
  void initState() {
    super.initState();
    fetchAttendees();
  }

  void fetchAttendees() async {
    var db = Mysql();
    await db.connect();
    var conn = db.connection;
    if (conn == null) {
      print('Failed to connect to the database');
      return;
    }

    try {
      var results = await conn.query('SELECT * FROM attendee');
      print('Query executed. Number of rows: ${results.length}'); // Debug: Number of rows fetched

      List<Map<String, dynamic>> fetchedAttendees = [];
      for (var row in results) {
        print('Row: $row'); // Debug: Print each row
        fetchedAttendees.add({
          'attendee_id': row['attendee_id'],
          'first_name': row['first_name'],
          'last_name': row['last_name'],
          'email': row['email'],
          'phone': row['phone'],
          'registered_at': row['registered_at'],
        });
      }
      setState(() {
        attendees = fetchedAttendees;
      });
      print('Attendees fetched successfully');
      print(attendees); // Debug: Print the fetched attendees
    } catch (e) {
      print('Error fetching attendees: $e');
    } finally {
      await conn.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('All Attendees')),
      body: SingleChildScrollView(
        child: attendees.isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: attendees.length,
                itemBuilder: (context, index) {
                  var attendee = attendees[index];
                  return Card(
                    margin: EdgeInsets.all(10),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${attendee['first_name']} ${attendee['last_name']}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text('Email: ${attendee['email']}'),
                          Text('Phone: ${attendee['phone']}'),
                          Text('Registered At: ${attendee['registered_at']}'),
                        ],
                      ),
                    ),
                  );
                },
              )
            : Center(child: CircularProgressIndicator()), // Show a loading indicator while data is being fetched
      ),
    );
  }
}
