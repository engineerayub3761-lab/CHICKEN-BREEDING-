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
  final TextEditingController bankNameController =
      TextEditingController(text: 'Commercial Bank of Ethiopia (CBE)');
  final TextEditingController accountNumberController =
      TextEditingController(text: '1000663203982');
  final TextEditingController accountHolderController =
      TextEditingController(text: 'AYUB AWOL SALIYA');

  final TextEditingController telebirrNameController =
      TextEditingController(text: 'Telebirr');
  final TextEditingController telebirrPhoneController =
      TextEditingController(text: '+251926959771');
  final TextEditingController telebirrHolderController =
      TextEditingController(text: 'Usen awel');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('የክፍያ እና የዶሮ እርባታ መረጃ'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ማራኪ የዶሮ እርባታ ፎቶ
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                'https://images.unsplash.com/photo-1548550023-2bdb3c5beed7?auto=format&fit=crop&w=600&q=80',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'የባንክ አካውንት መረጃ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green[800]),
            ),
            SizedBox(height: 10),
            TextField(
              controller: bankNameController,
              decoration: InputDecoration(
                labelText: 'የባንክ ስም',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: accountNumberController,
              decoration: InputDecoration(
                labelText: 'የሂሳብ ቁጥር (Account Number)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: accountHolderController,
              decoration: InputDecoration(
                labelText: 'የባንክ ባለቤቱ ስም',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 25),
            Text(
              'የቴሌብር (Telebirr) መረጃ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green[800]),
            ),
            SizedBox(height: 10),
            TextField(
              controller: telebirrNameController,
              decoration: InputDecoration(
                labelText: 'አገልግሎት',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: telebirrPhoneController,
              decoration: InputDecoration(
                labelText: 'ስልክ ቁጥር',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: telebirrHolderController,
              decoration: InputDecoration(
                labelText: 'ስም',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('የክፍያ መረጃው ተይዟል!')),
                  );
                },
                child: Text('መረጃውን አረጋግጥ', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
