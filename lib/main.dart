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

// 1. ማራኪው የመግቢያ (Cover) ገጽ
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green.shade600, Colors.green.shade900],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: const CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1548550023-2bdb3c5beed7?auto=format&fit=crop&w=400&q=80',
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'የዶሮ እርባታ 100+ ነፃ ስልጠና',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              const Text(
                'ለተጠቃሚዎች ሙሉ በሙሉ በነፃ የተዘጋጀ! ከ100 በላይ ሙያዊ የዶሮ እርባታ ትምህርቶችን እና መመሪያዎችን ያግኙ።',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 45),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.green.shade900,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
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

// 2. 100+ ትምህርቶችን የያዘው ዋናው ዝርዝር ገጽ
class MainContentScreen extends StatelessWidget {
  const MainContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> topics = List.generate(
      105,
      (index) => 'ክፍል ${index + 1}: የዶሮ እርባታ ሙያዊ ስልጠና እና መመሪያ',
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('የዶሮ እርባታ 100+ ነፃ ትምህርቶች'),
        backgroundColor: Colors.green.shade800,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.green.shade50,
            child: Row(
              children: const [
                Icon(Icons.check_circle, color: Colors.green),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'ሁሉም ትምህርቶች ሙሉ በሙሉ ነፃ ናቸው። ማንኛውንም ክፍል በመጫን ማንበብ ይችላሉ።',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: topics.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.green.shade700,
                      foregroundColor: Colors.white,
                      child: Text('${index + 1}'),
                    ),
                    title: Text(
                      topics[index],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text('ትምህርቱን ለመክፈት እዚህ ይጫኑ...'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                    onTap: () {
                      // ተጠቃሚው ሲጫነው ወደየራሱ የትምህርት ማንበቢያ ገጽ ይወስደዋል
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LessonDetailScreen(lessonNumber: index + 1),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          // የጉግል ማስታወቂያ (Google AdMob Banner Space)
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.grey.shade200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.ads_click, size: 16, color: Colors.grey),
                SizedBox(width: 8),
                Text(
                  'Google AdMob Advertisement Space',
                  style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 3. እያንዳንዱ ትምህርት ሲከፈት የሚታየው የዝርዝር ማንበቢያ ገጽ
class LessonDetailScreen extends StatelessWidget {
  final int lessonNumber;

  const LessonDetailScreen({super.key, required this.lessonNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ክፍል $lessonNumber መመሪያ'),
        backgroundColor: Colors.green.shade800,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'የዶሮ እርባታ ሙያዊ ስልጠና - ክፍል $lessonNumber',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'በዚህ የትምህርት ክፍል ውስጥ ስለ ዶሮ እርባታ አጠቃቀም፣ አያያዝ፣ የጤና ክትትል እና ምርታማነትን ማሳደግ የሚረዱ ጠቃሚ እና ዝርዝር መረጃዎች በሰፊው ተካተዋል።',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 20),
            const Text(
              'ቁልፍ ነጥቦች:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              '• የቦታ ዝግጅት እና ጽዳት\n• የተመጣጠነ መኖ እና ውሃ አቅርቦት\n• የክትባት ጊዜ ሰሌዳዎች\n• የገበያ ትስስር እና ሽያጭ',
              style: TextStyle(fontSize: 16, height: 1.6),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.green.shade200),
              ),
              child: const Text(
                'ማሳሰቢያ፡ ይህንን ትምህርት ሙሉ በሙሉ በመተግበር በዘርፉ የተሻለ ውጤት ማምጣት ይቻላል።',
                style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
