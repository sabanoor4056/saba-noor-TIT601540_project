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
      title: 'Ai Lie Detection System',
      home: const MobileFrame(),
    );
  }
}

class MobileFrame extends StatelessWidget {
  const MobileFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Container(
          width: 380,
          height: 780,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: const [
              BoxShadow(
                blurRadius: 10,
                color: Colors.black26,
              ),
            ],
          ),
          child: const HomePage(),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ai Lie Detection System"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: const [
          FeatureCard("Face Analysis", Icons.face, Colors.green),
          FeatureCard("Voice Analysis", Icons.mic, Colors.orange),
          FeatureCard("Body Language", Icons.accessibility, Colors.red),
          FeatureCard("Result Report", Icons.analytics, Colors.blue),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: () {},
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const FeatureCard(this.title, this.icon, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        leading: Icon(icon, color: color, size: 35),
        title: Text(title),
        subtitle: const Text("AI Detection Module"),
      ),
    );
  }
}