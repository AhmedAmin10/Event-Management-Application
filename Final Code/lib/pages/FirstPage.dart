import 'package:flutter/material.dart';
import 'package:project_v1/pages/Login.dart';
import 'package:project_v1/pages/Logo.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
     
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Add your image/logo here

            Logo(),

            SizedBox(height: 250),
            OutlinedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 22, 5, 82)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              child: Icon(Icons.arrow_forward),
            ),
            SizedBox(height: 10), // Adjust the spacing as needed
          ],
        ),
      ),
    );
  }
}