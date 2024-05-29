import 'package:flutter/material.dart';
import 'package:project_v1/MySQL_Connection/MySQL.dart';

class DeleteEventScreen extends StatefulWidget {
  @override
  _DeleteEventScreenState createState() => _DeleteEventScreenState();
}

class _DeleteEventScreenState extends State<DeleteEventScreen> {
  final TextEditingController _eventNameController = TextEditingController();
  final Mysql _mysql = Mysql();
  String _statusMessage = '';

  @override
  void initState() {
    super.initState();
    _mysql.connect().catchError((e) {
      setState(() {
        _statusMessage = 'Connection error: $e';
      });
    });
  }

  @override
  void dispose() {
    _mysql.close();
    _eventNameController.dispose();
    super.dispose();
  }

  void deleteEventByName(String eventName) async {
    if (_mysql.connection == null) {
      await _mysql.connect();
    }

    try {
      var conn = _mysql.connection;
      var result = await conn!
          .query('DELETE FROM events WHERE event_name = ?', [eventName]);

      if (result.affectedRows == 0) {
        setState(() {
          _statusMessage = 'Event not found: $eventName';
        });
      } else {
        setState(() {
          _statusMessage = 'Event deleted successfully: $eventName';
        });
      }
      _eventNameController.clear();
    } catch (e) {
      setState(() {
        _statusMessage = 'Error deleting event: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Delete Event')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _eventNameController,
              decoration: InputDecoration(labelText: 'Event Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter event name';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String eventName = _eventNameController.text.trim();
                if (eventName.isNotEmpty) {
                  deleteEventByName(eventName);
                } else {
                  setState(() {
                    _statusMessage = 'Please enter a valid event name';
                  });
                }
              },
              child: Text('Delete Event'),
            ),
            SizedBox(height: 20),
            Text(_statusMessage),
          ],
        ),
      ),
    );
  }
}
