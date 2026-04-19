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

class MobileFrame extends StatelessWidget {
  const MobileFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Container(
          width: 380,
          height: 800,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: const HomePage(),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController statementController = TextEditingController();

  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  String result = "";
  String accuracy = "";

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _controller.forward();
  }

  void analyze() {
    setState(() {
      // fake AI logic for demo
      bool isLie = statementController.text.length % 2 == 0;

      if (isLie) {
        result = "⚠️ LIE DETECTED";
        accuracy = "Accuracy: 87%";
      } else {
        result = "✅ TRUTH DETECTED";
        accuracy = "Accuracy: 91%";
      }

      _controller.forward(from: 0);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ai Lie Detection System"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [

            // 🖼 IMAGE
            FadeTransition(
              opacity: _fadeAnimation,
              child: Image.network(
                "https://cdn-icons-png.flaticon.com/512/4712/4712109.png",
                height: 110,
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              "AI Based Multi-Cue Lie Detection",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // 👤 NAME FIELD
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Enter Name",
                prefixIcon: const Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // 💬 STATEMENT FIELD
            TextField(
              controller: statementController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: "Enter Statement",
                prefixIcon: const Icon(Icons.message),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 🎯 BUTTON
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: analyze,
                icon: const Icon(Icons.analytics),
                label: const Text("Analyze Truth / Lie"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                ),
              ),
            ),

            const SizedBox(height: 25),

            // 📊 RESULT WITH ANIMATION
            AnimatedOpacity(
              opacity: result.isEmpty ? 0 : 1,
              duration: const Duration(seconds: 1),
              child: Column(
                children: [

                  Text(
                    result,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    accuracy,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // 📱 ICON FEATURES
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [

                Column(
                  children: [
                    Icon(Icons.face, color: Colors.green, size: 40),
                    Text("Face"),
                  ],
                ),

                Column(
                  children: [
                    Icon(Icons.mic, color: Colors.orange, size: 40),
                    Text("Voice"),
                  ],
                ),

                Column(
                  children: [
                    Icon(Icons.accessibility, color: Colors.red, size: 40),
                    Text("Body"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}