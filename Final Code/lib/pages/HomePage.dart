// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_v1/pages/AdminDashboard.dart';
import 'package:project_v1/pages/All_Attendees_Screan.dart';
import 'package:project_v1/pages/Login.dart';
import 'package:project_v1/pages/Regestration.dart';
import 'package:project_v1/pages/Scan.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Scan()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(167, 191, 199, 1)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20.0), // Set border radius
                    ),
                  ),
                  textStyle: MaterialStateProperty.all<TextStyle>(
                    GoogleFonts.pacifico(
                        fontSize: 24.0,
                        color: Colors.white), // Set custom font and text color
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 32.0), // Add padding
                  ),
                ),
                child: const Text('Scan'),
              ),

              SizedBox(height: 16.0), // Add space between buttons

              ElevatedButton(
                onPressed: () {
                  // Add registration button functionality here
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Regestration()));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(167, 191, 199, 1)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20.0), // Set border radius
                    ),
                  ),
                  textStyle: MaterialStateProperty.all<TextStyle>(
                    GoogleFonts.pacifico(
                        fontSize: 24.0,
                        color: Colors.white), // Set custom font and text color
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 32.0), // Add padding
                  ),
                ),
                child: const Text('Registration'),
              ),

              SizedBox(height: 16.0), // Add space between buttons

              ElevatedButton(
                  onPressed: () {
                  // Add registration button functionality here
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => AllAttendeesScreen()));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(167, 191, 199, 1)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20.0), // Set border radius
                    ),
                  ),
                  textStyle: MaterialStateProperty.all<TextStyle>(
                    GoogleFonts.pacifico(
                        fontSize: 24.0,
                        color: Colors.white), // Set custom font and text color
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 32.0), // Add padding
                  ),
                ),
                child: const Text('Attendee Management'),
              ),

              SizedBox(height: 16.0), // Add space between buttons

              ElevatedButton(
                onPressed: () {
                  // Add registration button functionality here
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => AdminDashboard()));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(167, 191, 199, 1)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20.0), // Set border radius
                    ),
                  ),
                  textStyle: MaterialStateProperty.all<TextStyle>(
                    GoogleFonts.pacifico(
                        fontSize: 24.0,
                        color: Colors.white), // Set custom font and text color
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 32.0), // Add padding
                  ),
                ),
                child: const Text('Admin Dashboard'),
              ),

              SizedBox(height: 16.0),

              ElevatedButton(
                 onPressed: () {
                  // Add registration button functionality here
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Login()));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(167, 191, 199, 1)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20.0), // Set border radius
                    ),
                  ),
                  textStyle: MaterialStateProperty.all<TextStyle>(
                    GoogleFonts.pacifico(
                        fontSize: 24.0,
                        color: Colors.white), // Set custom font and text color
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 32.0), // Add padding
                  ),
                ),
                child: const Text('Log Out'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
