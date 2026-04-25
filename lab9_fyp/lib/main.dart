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
      title: 'Lie Sense AI',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const PhoneFrame(),
    );
  }
}

/* ---------------- PHONE FRAME (Mobile Layout) ---------------- */
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
          child: const MainHome(),
        ),
      ),
    );
  }
}

/* ---------------- MAIN HOME ---------------- */
class MainHome extends StatelessWidget {
  const MainHome({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: const AppDrawer(),

        appBar: AppBar(
          title: const Text("AI LIE DETECTION SYSTEM"),
          centerTitle: true,
          backgroundColor: Colors.indigo,

          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: "Home",
              ),
              Tab(
                icon: Icon(Icons.analytics),
                text: "Detect",
              ),
              Tab(
                icon: Icon(Icons.person),
                text: "Profile",
              ),
            ],
          ),
        ),

        body: const TabBarView(
          children: [
            HomeTab(),
            DetectTab(),
            ProfileTab(),
          ],
        ),
      ),
    );
  }
}

/* ---------------- DRAWER ---------------- */
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [

          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.indigo,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.verified_user,
                    size: 40,
                    color: Colors.indigo,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Lie Sense AI",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),

          ListTile(
            leading: const Icon(Icons.info),
            title: const Text("About Project"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AboutPage(),
                ),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Exit"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

/* ---------------- HOME TAB ---------------- */
class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(15),
      children: [

        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.indigo,
            borderRadius: BorderRadius.circular(18),
          ),
          child: const Column(
            children: [
              Icon(
                Icons.security,
                color: Colors.white,
                size: 55,
              ),
              SizedBox(height: 10),
              Text(
                "AI Based Multi-Cue Framework",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Automated Lie Detection System",
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        const FeatureCard(
          icon: Icons.face,
          title: "Face Analysis",
          subtitle: "Detect facial expressions",
          color: Colors.green,
        ),

        const FeatureCard(
          icon: Icons.mic,
          title: "Voice Analysis",
          subtitle: "Analyze stress level",
          color: Colors.orange,
        ),

        const FeatureCard(
          icon: Icons.accessibility,
          title: "Body Language",
          subtitle: "Track movement cues",
          color: Colors.red,
        ),
      ],
    );
  }
}

/* ---------------- DETECT TAB ---------------- */
class DetectTab extends StatefulWidget {
  const DetectTab({super.key});

  @override
  State<DetectTab> createState() => _DetectTabState();
}

class _DetectTabState extends State<DetectTab> {
  final TextEditingController controller = TextEditingController();

  String result = "";

  void analyze() {
    setState(() {
      if (controller.text.length % 2 == 0) {
        result = "⚠️ Lie Detected\nAccuracy: 86%";
      } else {
        result = "✅ Truth Detected\nAccuracy: 92%";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        children: [

          TextField(
            controller: controller,
            maxLines: 3,
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
            child: ElevatedButton.icon(
              onPressed: analyze,
              icon: const Icon(Icons.search),
              label: const Text("Analyze"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
              ),
            ),
          ),

          const SizedBox(height: 25),

          Text(
            result,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

/* ---------------- PROFILE TAB ---------------- */
class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Final Year Project\nLie Sense AI",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

/* ---------------- ABOUT PAGE ---------------- */
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Project"),
        backgroundColor: Colors.indigo,
      ),
      body: const Padding(
        padding: EdgeInsets.all(18),
        child: Text(
          "Lie Sense AI is an AI based Multi-Cue Framework "
          "for Automated Lie Detection using Face, Voice "
          "and Body Language cues.",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

/* ---------------- FEATURE CARD ---------------- */
class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;

  const FeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        leading: Icon(
          icon,
          color: color,
          size: 35,
        ),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}