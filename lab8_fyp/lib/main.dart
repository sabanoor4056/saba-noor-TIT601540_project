import 'package:flutter/material.dart';

void main() {
  runApp(const LieSenseAIApp());
}

class LieSenseAIApp extends StatelessWidget {
  const LieSenseAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AI LIE DETECTION',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const PhoneFrame(),
    );
  }
}

/* ---------------- PHONE FRAME ---------------- */
class PhoneFrame extends StatelessWidget {
  const PhoneFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Center(
        child: Container(
          width: 390,
          height: 820,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
            boxShadow: const [
              BoxShadow(
                blurRadius: 12,
                color: Colors.black26,
              ),
            ],
          ),
          child: const MainScreen(),
        ),
      ),
    );
  }
}

/* ---------------- MAIN SCREEN ---------------- */
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    DetectPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AI LIE DETECTION"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),

      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.indigo,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: "Detect",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

/* ---------------- HOME PAGE ---------------- */
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(15),
      children: [

        Hero(
          tag: "ai_logo",
          child: CircleAvatar(
            radius: 55,
            backgroundColor: Colors.indigo.shade100,
            child: const Icon(
              Icons.verified_user,
              size: 60,
              color: Colors.indigo,
            ),
          ),
        ),

        const SizedBox(height: 20),

        const Text(
          "AI Based Multi-Cue Framework",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 10),

        const Text(
          "Automated Lie Detection using Face, Voice and Body Language",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15),
        ),

        const SizedBox(height: 25),

        Card(
          child: ListTile(
            leading: const Icon(Icons.face, color: Colors.green),
            title: const Text("Face Analysis"),
            subtitle: const Text("Detect facial expressions"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const DetailPage(
                    title: "Face Analysis",
                    icon: Icons.face,
                    color: Colors.green,
                  ),
                ),
              );
            },
          ),
        ),

        Card(
          child: ListTile(
            leading: const Icon(Icons.mic, color: Colors.orange),
            title: const Text("Voice Analysis"),
            subtitle: const Text("Analyze voice stress"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const DetailPage(
                    title: "Voice Analysis",
                    icon: Icons.mic,
                    color: Colors.orange,
                  ),
                ),
              );
            },
          ),
        ),

        Card(
          child: ListTile(
            leading: const Icon(Icons.accessibility, color: Colors.red),
            title: const Text("Body Language"),
            subtitle: const Text("Track movement cues"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const DetailPage(
                    title: "Body Language",
                    icon: Icons.accessibility,
                    color: Colors.red,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

/* ---------------- DETECT PAGE ---------------- */
class DetectPage extends StatefulWidget {
  const DetectPage({super.key});

  @override
  State<DetectPage> createState() => _DetectPageState();
}

class _DetectPageState extends State<DetectPage> {
  String result = "";

  void checkLie() {
    setState(() {
      result = "Truth Accuracy: 91%\nLie Accuracy: 84%";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: "Enter Statement",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: checkLie,
              child: const Text("Analyze"),
            ),
          ),

          const SizedBox(height: 25),

          Text(
            result,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),
        ],
      ),
    );
  }
}

/* ---------------- PROFILE PAGE ---------------- */
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Developed for FYP\nLie Sense AI",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

/* ---------------- DETAIL PAGE ---------------- */
class DetailPage extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const DetailPage({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: color,
      ),

      body: Center(
        child: Hero(
          tag: "ai_logo",
          child: Icon(
            icon,
            size: 140,
            color: color,
          ),
        ),
      ),
    );
  }
}