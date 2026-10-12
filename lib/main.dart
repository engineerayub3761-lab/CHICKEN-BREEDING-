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
      home: WelcomeScreen(),
    );
  }
}

// 1. ማራኪ የሆነው የመግቢያ (Cover) ገጽ
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green[700]!, Colors.green[900]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // የዶሮ ሎጎ/ፎቶ
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1548550023-2bdb3c5beed7?auto=format&fit=crop&w=300&q=80',
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                'የዶሮ እርባታ ሙሉ መመሪያ',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              const Text(
                'ዘመናዊ የዶሮ እርባታ ስልጠናዎችን፣ መኖ አዘገጃጀትን እና የክፍያ መረጃዎችን በአንድ ላይ ያግኙ።',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.green[900],
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => BankAccountScreen()),
                    );
                  },
                  child: const Text(
                    'መተግበሪያውን ጀምር',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 2. የክፍያ እና መረጃ ገጽ
class BankAccountScreen extends StatelessWidget {
  BankAccountScreen({super.key});

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
        title: Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1548550023-2bdb3c5beed7?auto=format&fit=crop&w=150&q=80',
              ),
            ),
            const SizedBox(width: 10),
            const Text('የክፍያ እና የዶሮ እርባታ መረጃ'),
          ],
        ),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'የባንክ አካውንት መረጃ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: bankNameController,
              decoration: const InputDecoration(
                labelText: 'የባንክ ስም',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: accountNumberController,
              decoration: const InputDecoration(
                labelText: 'የሂሳብ ቁጥር (Account Number)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: accountHolderController,
              decoration: const InputDecoration(
                labelText: 'የባንክ ባለቤቱ ስም',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'የቴሌብር (Telebirr) መረጃ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: telebirrNameController,
              decoration: const InputDecoration(
                labelText: 'አገልግሎት',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: telebirrPhoneController,
              decoration: const InputDecoration(
                labelText: 'ስልክ ቁጥር',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: telebirrHolderController,
              decoration: const InputDecoration(
                labelText: 'ስም',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('የክፍያ መረጃው ተይዟል!')),
                  );
                },
                child: const Text('መረጃውን አረጋግጥ', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
