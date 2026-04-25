import 'package:flutter/material.dart';

void main() {
  runApp(const LieSenseApp());
}

class LieSenseApp extends StatelessWidget {
  const LieSenseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lie Sense AI',
      home: const MobileFrame(),
    );
  }
}

/* ---------------- MOBILE FRAME ---------------- */
class MobileFrame extends StatelessWidget {
  const MobileFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Container(
          width: 390,
          height: 820,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
          ),
          child: const HomePage(),
        ),
      ),
    );
  }
}

/* ---------------- HOME PAGE ---------------- */
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [

        /* SLIVER APP BAR */
        SliverAppBar(
          expandedHeight: 160,
          floating: true,
          pinned: true,
          backgroundColor: Colors.indigo,
          flexibleSpace: FlexibleSpaceBar(
            title: const Text("AI LIE DETECTION SYSTEM"),
            background: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.indigo, Colors.blue],
                ),
              ),
              child: const Center(
                child: Icon(
                  Icons.verified_user,
                  size: 70,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),

        /* LIST SECTION */
        SliverList(
          delegate: SliverChildListDelegate(
            [

              const SizedBox(height: 10),

              const Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  "AI Based Multi-Cue Framework",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const FeatureCard(
                title: "Face Analysis",
                subtitle: "Detect facial expressions",
                icon: Icons.face,
                color: Colors.green,
              ),

              const FeatureCard(
                title: "Voice Analysis",
                subtitle: "Analyze voice stress",
                icon: Icons.mic,
                color: Colors.orange,
              ),

              const FeatureCard(
                title: "Body Language",
                subtitle: "Track movement cues",
                icon: Icons.accessibility,
                color: Colors.red,
              ),

              const SizedBox(height: 15),

              /* ✅ ADDED BUTTON */
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.play_arrow),
                    label: const Text("Start Lie Detection"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      padding: const EdgeInsets.all(15),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ResultPage(),
                        ),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),

        /* GRID SECTION */
        SliverPadding(
          padding: const EdgeInsets.all(12),
          sliver: SliverGrid(
            delegate: SliverChildListDelegate(
              const [
                GridCard(icon: Icons.face, label: "Face"),
                GridCard(icon: Icons.mic, label: "Voice"),
                GridCard(icon: Icons.visibility, label: "Eye"),
                GridCard(icon: Icons.timeline, label: "Pattern"),
              ],
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.2,
            ),
          ),
        ),
      ],
    );
  }
}

/* ---------------- RESULT PAGE ---------------- */
class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detection Result"),
        backgroundColor: Colors.indigo,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.analytics, size: 80, color: Colors.indigo),
            SizedBox(height: 20),
            Text(
              "Lie Detection Completed",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Truth Accuracy: 91%\nLie Accuracy: 87%",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

/* ---------------- FEATURE CARD ---------------- */
class FeatureCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;

  const FeatureCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: Icon(icon, color: color, size: 35),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}

/* ---------------- GRID CARD ---------------- */
class GridCard extends StatelessWidget {
  final IconData icon;
  final String label;

  const GridCard({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.indigo.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.indigo),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.indigo),
          const SizedBox(height: 10),
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}