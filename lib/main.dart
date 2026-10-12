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
      title: 'የዶሮ እርባታ መሪ',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2E7D32),
          primary: const Color(0xFF2E7D32),
          surface: const Color(0xFFF8F9FA),
        ),
        scaffoldBackgroundColor: const Color(0xFFF4F6F8),
        fontFamily: 'sans-serif',
      ),
      home: const DashboardScreen(),
    );
  }
}

class ChapterModel {
  final String id;
  final String title;
  final String subtitle;
  final IconData icon;
  final Color themeColor;
  final String content;
  final bool isPremium;
  bool isBookmarked;

  ChapterModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.themeColor,
    required this.content,
    this.isPremium = false,
    this.isBookmarked = false,
  });
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<ChapterModel> _chapters = [
    ChapterModel(
      id: '01',
      title: 'ምዕራፍ 1',
      subtitle: 'መግቢያ እና የዶሮ እርባታ መሠረቶች',
      icon: Icons.rocket_launch_rounded,
      themeColor: const Color(0xFF2E7D32),
      isPremium: false,
      content: '''
1.1 የዶሮ እርባታ ዘርፍ እድሎች እና ፈተናዎች
• እድሎች፡ ከፍተኛ የገበያ ፍላጎት፣ አነስተኛ የመነሻ ካፒታል፣ ፈጣን የምርት ገቢ።
• ፈተናዎች፡ የመኖ ዋጋ ውድነት፣ የበሽታዎች ስርጭት፣ የእውቀት ማነስ።

1.2 የዶሮ እርባታ ዓይነቶች
• የእንቁላል ምርት (Layer Farming) - ለ 72-80 ሳምንታት ምርት ይሰጣሉ።
• የስጋ ምርት (Broiler Farming) - ከ 40-45 ቀናት ውስጥ ለገበያ ይደርሳሉ።
• ሁለገብ እርባታ (Dual Purpose) - ለስጋም ለእንቁላልም የሚሆኑ (ምሳሌ፡ Sasso)።
''',
    ),
    ChapterModel(
      id: '02',
      title: 'ምዕራፍ 2',
      subtitle: 'የዶሮ ዝርያዎች መረጣ እና ባህሪያቸው',
      icon: Icons.pets_rounded,
      themeColor: const Color(0xFF1565C0),
      isPremium: false,
      content: '''
2.1 የአገር ውስጥ (ሀበሻ) ዶሮዎች
• የበሽታ የመቋቋም አቅማቸው ከፍተኛ ቢሆንም በዓመት ከ 40-60 እንቁላል ብቻ ይሰጣሉ።

2.2 የተሻሻሉ ዝርያዎች
• የእንቁላል (Bovans/ISA Brown)፡ በዓመት 300-320 እንቁላል ይጥላሉ።
• የስጋ (Cobb 500/Ross 308)፡ በ 45 ቀናት ውስጥ 2.0-2.5 ኪ.ግ ክብደት ይደርሳሉ።
• ሁለገብ (Sasso)፡ በዓመት 180-220 እንቁላል።
''',
    ),
    ChapterModel(
      id: '03',
      title: 'ምዕራፍ 3',
      subtitle: 'የዶሮ ቤት አሰራር እና ቴክኖሎጂ',
      icon: Icons.home_work_rounded,
      themeColor: const Color(0xFFE65100),
      isPremium: false,
      content: '''
3.1 የቤት ቦታ መረጣ
• ከመኖሪያ ቤት የራቀ፣ አየር የሚያስገባ፣ የጎርፍ ስጋት የሌለበት መሆን አለበት።

3.2 አቀማመጥ እና አየር ዝውውር
• የቤቱ ረጅሙ ጎን ከምስራቅ ወደ ምዕራብ መዘርጋት አለበት።
• የመስኮቶች ስፋት ከጎን ግድግዳ 20%-30% መሸፈን አለበት።
''',
    ),
    ChapterModel(
      id: '04',
      title: 'ምዕራፍ 4 (Premium)',
      subtitle: 'የዶሮ ምግብ እና አሰራር ቀመር',
      icon: Icons.flatware_rounded,
      themeColor: const Color(0xFF6A1B9A),
      isPremium: true,
      content: '''
[የተቆለፈ የፕሪሚየም ይዘት]
• በአካባቢ ግብአቶች መኖ በቤት ውስጥ የማዘጋጀት ሙሉ ቀመር (Feed Formulation Ratio)።
• የፕሮቲን እና የኃይል ስሌቶች።
• ለተለያዩ የእድገት ደረጃዎች የሚሰጡ የመኖ መጠኖች።
''',
    ),
    ChapterModel(
      id: '05',
      title: 'ምዕራፍ 5 (Premium)',
      subtitle: 'የዶሮ ጤና እና የክትባት ፕሮግራም',
      icon: Icons.health_and_safety_rounded,
      themeColor: const Color(0xFFC62828),
      isPremium: true,
      content: '''
[የተቆለፈ የፕሪሚየም ይዘት]
• የኒውካስል፣ ጎምቦሮ እና ኮክሲዲዮሲስ በሽታዎች ሙሉ የህክምና መመሪያ።
• የክትባት ሳምንታዊ መርሃ-ግብር።
''',
    ),
    ChapterModel(
      id: '06',
      title: 'ምዕራፍ 6 (Premium)',
      subtitle: 'የገበያ ትስስር እና የትርፍ ስሌት',
      icon: Icons.payments_rounded,
      themeColor: const Color(0xFF00695C),
      isPremium: true,
      content: '''
[የተቆለፈ የፕሪሚየም ይዘት]
• የምርት ሽያጭ እና የገበያ ትስስር መፍጠሪያ መንገዶች።
• የሂሳብ መዝገብ አያያዝ።
''',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('የዶሮ እርባታ ስኬት መሪ'),
        backgroundColor: const Color(0xFF1B5E20),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.calculate_outlined),
            tooltip: 'የመኖ ማስያዣ',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CalculatorScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _chapters.length,
        itemBuilder: (context, index) {
          final item = _chapters[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: ListTile(
              leading: Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: item.themeColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(item.icon, color: item.themeColor),
              ),
              title: Text(
                item.title,
                style: TextStyle(
                  color: item.themeColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              subtitle: Text(
                item.subtitle,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2C3E50),
                ),
              ),
              trailing: item.isPremium
                  ? const Icon(Icons.lock_outline_rounded, color: Colors.orange)
                  : const Icon(Icons.arrow_forward_ios_rounded, size: 14, color: Colors.grey),
              onTap: () {
                if (item.isPremium) {
                  _showUnlockDialog(context, item);
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReadingScreen(chapter: item),
                    ),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }

  void _showUnlockDialog(BuildContext context, ChapterModel chapter) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: const [
            Icon(Icons.stars_rounded, color: Colors.amber),
            SizedBox(width: 8),
            Text('ፕሪሚየም ይዘት'),
          ],
        ),
        content: Text(
          '${chapter.title}ን ለማንበብ እና ሙሉ የመኖ/የክትባት መመሪያዎችን ለማግኘት የፕሪሚየም አባል ይሁኑ።\n\nበቴሌብር ወይም በባንክ በ 50 ብር ብቻ መክፈት ይችላሉ።',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('ተመለስ'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2E7D32),
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('የክፍያ አገልግሎት በቅርቡ ይጀምራል!'),
                ),
              );
            },
            child: const Text('አሁን ክፈት'),
          ),
        ],
      ),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController _countController = TextEditingController();
  double _dailyFeedKg = 0;
  double _estimatedCost = 0;

  void _calculate() {
    final count = double.tryParse(_countController.text) ?? 0;
    setState(() {
      _dailyFeedKg = (count * 110) / 1000;
      _estimatedCost = _dailyFeedKg * 45;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('የመኖ እና ወጪ ማስያዣ'),
        backgroundColor: const Color(0xFF2E7D32),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'የዶሮዎችዎን ብዛት ያስገቡ፡',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _countController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'ምሳሌ፦ 500',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.calculate),
                  onPressed: _calculate,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.green.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'የቀን መኖ ፍላጎት፡ ${_dailyFeedKg.toStringAsFixed(1)} ኪሎግራም',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'ተገመተ የቀን ወጪ፡ ${_estimatedCost.toStringAsFixed(0)} ብር',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.orange),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReadingScreen extends StatelessWidget {
  final ChapterModel chapter;

  const ReadingScreen({super.key, required this.chapter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(chapter.title),
        backgroundColor: chapter.themeColor,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              chapter.subtitle,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: chapter.themeColor,
              ),
            ),
            const Divider(height: 24),
            Text(
              chapter.content,
              style: const TextStyle(fontSize: 16, height: 1.8),
            ),
          ],
        ),
      ),
    );
  }
}
