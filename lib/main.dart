import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:csv/csv.dart';
import 'package:nova_threatrix/dashboard.dart';
// import 'dart:ui' show lerpDouble;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter CSV Match App',
      theme: ThemeData(),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<List<dynamic>>? _testData;
  List<List<dynamic>>? _trainData;
  List<dynamic>? _bestMatch;
  bool _isLoading = false;
  bool _fileUploaded = false; // Track whether the file has been uploaded

  Future<void> _pickTestFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _isLoading = true;
        _fileUploaded = true; // Set to true after successful file upload
      });

      // ... (rest of your code)

      _findBestMatch();

      _showDialog('Success', 'File uploaded and processing started.');
    } else {
      _showDialog('Error', 'No file selected or file selection canceled.');
    }
  }

  void _findBestMatch() {
    // ... (rest of your code)

    setState(() {
      _isLoading = false;
    });
  }

  void _showDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              child: const Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nova Treatrix',
          style: TextStyle(
            color: Colors.white, // Set title color
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true, // Center the title
        backgroundColor:
            const Color.fromRGBO(255, 84, 98, 1), // Set background color
      ),
      body: Container(
        color: const Color(0xFFFCD6D9),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/upload.png',
                width: 250, // Adjust the width as needed
                height: 250, // Adjust the height as needed
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _pickTestFile,
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.yellow),
                ),
                child: const Text('Upload your file'),
              ),
              const SizedBox(height: 20),
              if (_fileUploaded) // Show the second button only if the file is uploaded
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DashboardScreen()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.lightGreen),
                  ),
                  child: const Text('Check results'),
                ),
              const SizedBox(height: 20),
              if (_isLoading)
                const CircularProgressIndicator()
              else if (_bestMatch != null) ...[
                const Text('Best Matching Record:',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(_bestMatch.toString(),
                      style: const TextStyle(fontSize: 16)),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}


