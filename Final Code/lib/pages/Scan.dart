import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:project_v1/MySQL_Connection/MySQL.dart';
import 'package:project_v1/pages/HomePage.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class Scan extends StatefulWidget {
  const Scan({Key? key}) : super(key: key);

  @override
  State<Scan> createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');
  late QRViewController _controller;
  String scannedData = '';
  var db = Mysql();

  @override
  void initState() {
    super.initState();
    _requestCameraPermission();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 350,
              height: 350,
              child: QRView(
                key: _qrKey,
                onQRViewCreated: _onQRViewCreated,
              ),
            ),
          ),
          const SizedBox(height: 40.0),
          Container(
            width: 300,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Text(
              scannedData.isEmpty ? 'Scanning...' : scannedData,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 250,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: MaterialButton(
                onPressed: resetScan,
                color: Color(0xFF001B94),
                textColor: Colors.white,
                padding: const EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Reset',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
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
    );
  }

  Future<void> _requestCameraPermission() async {
    if (await Permission.camera.request().isGranted) {
      // Permission is granted, continue with the QR code scanning
    } else {
      // Permission is not granted, show a message or handle it accordingly
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Camera Permission Required'),
          content: Text('Please grant camera permission to use the QR scanner.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  void _onQRViewCreated(QRViewController controller) {
    this._controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      setState(() {
        scannedData = scanData.code!;
      });

      // Connect to the database and check if scanned data exists
      await db.connect();
      var conn = db.connection;
      if (conn == null) {
        print('Failed to connect to the database');
        showFailureSnackBar('Database connection failed');
        return;
      }

      try {
        var results = await conn.query('SELECT * FROM attendee WHERE first_name = ?', [scannedData]);
        if (results.isNotEmpty) {
          showSuccessSnackBar();
        } else {
          showFailureSnackBar('Scanned data does not exist in the table');
        }
      } catch (e) {
        print('Error checking scanned data: $e');
        showFailureSnackBar('Error checking scanned data');
      } finally {
        await db.close();
      }
    });
  }

  void showSuccessSnackBar() {
    final snackBar = SnackBar(
      content: Text('Scanned data exists in the table'),
      backgroundColor: Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showFailureSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void resetScan() {
    setState(() {
      scannedData = '';
    });
    _controller.resumeCamera();
  }
}
