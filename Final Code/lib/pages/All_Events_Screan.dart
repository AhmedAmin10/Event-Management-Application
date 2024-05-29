// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project_v1/MySQL_Connection/MySQL.dart';

class AllEventsScreen extends StatefulWidget {
  @override
  _AllEventsScreenState createState() => _AllEventsScreenState();
}

class _AllEventsScreenState extends State<AllEventsScreen> {
  List<Map<String, dynamic>> events = [];

  @override
  void initState() {
    super.initState();
    fetchEvents();
  }

  void fetchEvents() async {
    var db = Mysql();
    await db.connect();
    var conn = db.connection;
    if (conn == null) {
      print('Failed to connect to the database');
      return;
    }

    try {
      var results = await conn.query('SELECT * FROM events');
      print('Query executed. Number of rows: ${results.length}'); // Debug: Number of rows fetched

      List<Map<String, dynamic>> fetchedEvents = [];
      for (var row in results) {
        print('Row: $row'); // Debug: Print each row
        fetchedEvents.add({
          'id': row['id'],
          'event_name': row['event_name'],
          'organizer': row['organizer'],
          'date': row['date'],
          'location': row['location'],
          'description': row['description'],
        });
      }
      setState(() {
        events = fetchedEvents;
      });
      print('Events fetched successfully');
      print(events); // Debug: Print the fetched events
    } catch (e) {
      print('Error fetching events: $e');
    } finally {
      await conn.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('All Events')),
      body: SingleChildScrollView(
        child: events.isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: events.length,
                itemBuilder: (context, index) {
                  var event = events[index];
                  return Card(
                    margin: EdgeInsets.all(10),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            event['event_name'],
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text('Organizer: ${event['organizer']}'),
                          Text('Date: ${event['date']}'),
                          Text('Location: ${event['location']}'),
                          SizedBox(height: 5),
                          Text(event['description']),
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
