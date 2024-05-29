// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project_v1/MySQL_Connection/MySQL.dart';
import 'package:project_v1/pages/HomePage.dart';
import 'package:project_v1/pages/Logo.dart';

class Regestration extends StatefulWidget {
  const Regestration({super.key});

  @override
  State<Regestration> createState() => _RegestrationState();
}

class _RegestrationState extends State<Regestration> {
  TextEditingController FirstNameController = TextEditingController();
  TextEditingController LastNameController = TextEditingController();
  TextEditingController EmailController= TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  final Mysql mysql = Mysql();

  @override
  void initState() {
    super.initState();
    mysql.connect();
  }

  @override
  void dispose() {
    mysql.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Logo(),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Registration',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 27, 148),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 50,
                width: 350,
                child: TextField(
                  controller: FirstNameController,
                  obscureText: false,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.text_snippet_rounded),
                    border: OutlineInputBorder(),
                    iconColor: Color.fromARGB(255, 0, 27, 148),
                    labelText: 'First Name',
                  ),
                ),
              ),
              SizedBox(height: 20),
               SizedBox(
                height: 50,
                width: 350,
                child: TextField(
                  controller: LastNameController,
                  obscureText: false,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.text_snippet_rounded),
                    border: OutlineInputBorder(),
                    iconColor: Color.fromARGB(255, 0, 27, 148),
                    labelText: 'Last Name',
                  ),
                ),
              ),

              SizedBox(height: 20),
              
              SizedBox(
                height: 50,
                width: 350,
                child: TextField(
                  controller: EmailController,
                  obscureText: false,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail),
                    border: OutlineInputBorder(),
                    iconColor: Color.fromARGB(255, 0, 27, 148),
                    labelText: ' Email',
                  ),
                ),
              ),

              SizedBox(height: 20),
              


              SizedBox(
                height: 50,
                width: 350,
                child: TextField(
                  controller: phoneNumberController,
                  obscureText: false,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(),
                    iconColor: Color.fromARGB(255, 0, 27, 148),
                    labelText: 'Phone Number',
                  ),
                ),
              ),
          
              SizedBox(height: 20),



              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 0, 27, 148)),
                    ),
                    onPressed: () async {
                      // Get firstname from TextField
                      String FisrtName = FirstNameController.text;
                      // Get lastname from TextField
                      String LastName = LastNameController.text;
                      // Get email from TextField
                      String Email = EmailController.text;
                      // Get phoneNumber from TextField
                      String phoneNumber = phoneNumberController.text;
                     

                      // Validate inputs
                      if (FisrtName.isEmpty || phoneNumber == 0 || LastName.isEmpty || LastName.isEmpty ) {
                        // Show an error message or handle invalid input
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please enter all fields')),
                        );
                        return;
                      }

                      try {
                        // Register user
                        await mysql.register(FisrtName, LastName , Email, phoneNumber);

                        // Show success message
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Registration successful')),
                        );

                        // Clear text fields
                        FirstNameController.clear();
                        LastNameController.clear();
                        EmailController.clear();
                        phoneNumberController.clear();
                        
                      } catch (e) {
                        // Show error message
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Registration failed: $e')),
                        );
                      }
                    },
                    child: Text('Register'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              OutlinedButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 14, 5, 5)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Icon(Icons.arrow_back),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
