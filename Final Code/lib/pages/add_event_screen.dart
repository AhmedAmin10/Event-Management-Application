import 'package:flutter/material.dart';
import 'package:project_v1/MySQL_Connection/MySQL.dart';

class AddEventScreen extends StatefulWidget {
  @override
  _AddEventScreenState createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _eventNameController = TextEditingController();
  final TextEditingController _organizerController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final Mysql _mysql = Mysql();

  @override
  void initState() {
    super.initState();
    _mysql.connect();
  }

  @override
  void dispose() {
    _mysql.close();
    super.dispose();
  }

  void addEvent() async {
    if (_formKey.currentState!.validate()) {
      try {
        // Ensure the connection is established
        if (_mysql.connection == null) {
          await _mysql.connect();
        }

        // Access the connection
        var conn = _mysql.connection;

        await conn!.query(
          'INSERT INTO events (event_name, organizer, date, location, description) VALUES (?, ?, ?, ?, ?)',
          [
            _eventNameController.text,
            _organizerController.text,
            _dateController.text,
            _locationController.text,
            _descriptionController.text,
          ],
        );

        // Optionally, show a success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Event added successfully')),
        );

        // Clear the form after successful submission
        _eventNameController.clear();
        _organizerController.clear();
        _dateController.clear();
        _locationController.clear();
        _descriptionController.clear();
      } catch (e) {
        print('Error inserting event: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add event')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Event')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
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
                TextFormField(
                  controller: _organizerController,
                  decoration: InputDecoration(labelText: 'Organizer'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter organizer';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _dateController,
                  decoration: InputDecoration(labelText: 'Date (YYYY-MM-DD)'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter date';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _locationController,
                  decoration: InputDecoration(labelText: 'Location'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter location';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: addEvent,
                  child: Text('Add Event'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
