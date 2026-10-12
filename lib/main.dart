import 'package:flutter/material.dart';

void main() {
  runApp(const PoultryApp());
}

class PoultryApp extends StatelessWidget {
  const PoultryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'የዶሮ እርባታ መተግበሪያ',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: BankAccountScreen(),
    );
  }
}

class BankAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('የባንክ አካውንት መረጃ'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'እባክዎ የገንዘብ ማስተላለፊያ የባንክ አካውንትዎን ያስገቡ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'የባንክ ስም (ለምሳሌ፦ የኢትዮጵያ ንግድ ባንክ)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              decoration: InputDecoration(
                labelText: 'የሂሳብ ቁጥር (Account Number)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 15),
            TextField(
              decoration: InputDecoration(
                labelText: 'የባንክ ባለቤቱ ስም',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('የባንክ መረጃው በተሳካ ሁኔታ ተመዝግቧል!')),
                );
              },
              child: Text('አስቀምጥ'),
            ),
          ],
        ),
      ),
    );
  }
}
