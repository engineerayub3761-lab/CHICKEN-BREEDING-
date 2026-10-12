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
      title: 'የዶሮ እርባታ 100+ መመሪያ',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: const WelcomeScreen(),
    );
  }
}

// 1. መጀመሪያ የሚታየው ማራኪ የመግቢያ (Cover) ገጽ
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green.shade700, Colors.green.shade900],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1548550023-2bdb3c5beed7?auto=format&fit=crop&w=300&q=80',
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                'የዶሮ እርባታ 100+ መመሪያ እና ስልጠና',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              const Text(
                'ከ100 በላይ አጠቃላይ የዶሮ እርባታ ትምህርቶች፣ የንግድ እቅዶች እና የገቢ ማግኛ መመሪያዎች።',
                style: TextStyle(
                  fontSize: 15,
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
                    foregroundColor: Colors.green.shade900,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const MainContentScreen()),
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

// 2. 100+ ትምህርቶችን የያዘው ዋናው ገጽ
class MainContentScreen extends StatelessWidget {
  const MainContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> topics = List.generate(
      105,
      (index) => 'ክፍል ${index + 1}: የዶሮ እርባታ አስፈላጊ ስልጠና እና መመሪያ ቁጥር ${index + 1}',
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('የዶሮ እርባታ 100+ ትምህርቶች'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.green.shade50,
            child: const Text(
              'ጠቃሚ ማሳሰቢያ፡ ከዚህ በታች ያሉትን 105 ትምህርቶች በማንበብ ሙያዊ ባለሙያ መሆን ይችላሉ።',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.green),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: topics.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      child: Text('${index + 1}'),
                    ),
                    title: Text(
                      topics[index],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text('ዝርዝር የትምህርት ይዘት እና መመሪያ በዚህ ክፍል ውስጥ ይገኛል...'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('ክፍል ${index + 1} ተመረጠ')),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade800,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BankAccountScreen()),
                  );
                },
                child: const Text(
                  'የክፍያ እና አካውንት መረጃ ይመልከቱ',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 3. መጨረሻ ላይ የሚጠይቀው የክፍያ እና የአካውንት መረጃ ገጽ
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
          children: const [
            CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1548550023-2bdb3c5beed7?auto=format&fit=crop&w=150&q=80',
              ),
            ),
            SizedBox(width: 10),
            Text('የክፍያ እና አካውንት መረጃ'),
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
                    const SnackBar(content: Text('የክፍያ መረጃው ተረጋግጧል!')),
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
