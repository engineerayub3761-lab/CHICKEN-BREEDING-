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
      title: 'የዶሮ እርባታ 100+ ነፃ መመሪያ',
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
                'የዶሮ እርባታ 100+ ነፃ ስልጠና',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              const Text(
                'ሁሉንም ከ100 በላይ የዶሮ እርባታ ትምህርቶች እና መመሪያዎች ሙሉ በሙሉ በነፃ ያግኙ!',
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
                    'መተግበሪያውን በነፃ ጀምር',
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

// 2. 100+ ነፃ ትምህርቶችን የያዘው ዋናው ገጽ
class MainContentScreen extends StatelessWidget {
  const MainContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> topics = List.generate(
      105,
      (index) => 'ክፍል ${index + 1}: የዶሮ እርባታ ሙያዊ ስልጠና እና መመሪያ ቁጥር ${index + 1}',
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('የዶሮ እርባታ 100+ ነፃ ትምህርቶች'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.green.shade50,
            child: const Text(
              'ማሳሰቢያ፡ ይህ መተግበሪያ ሙሉ በሙሉ ነፃ ነው። ከታች ያሉትን 105 ክፍሎች በመምረጥ ማንበብ ይችላሉ።',
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
                    subtitle: const Text('ዝርዝር የትምህርት ይዘት በዚህ ክፍል ውስጥ በነፃ ይገኛል...'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('ክፍል ${index + 1} ተከፍቷል')),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          // እዚህ ታች ላይ የጉግል ማስታወቂያ (Google AdMob Banner) የሚቀመጥበት ቦታ ይኖራል
          Container(
            padding: const EdgeInsets.all(10),
            color: Colors.grey.shade200,
            child: const Center(
              child: Text(
                'Google AdMob Advertisement Space',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
