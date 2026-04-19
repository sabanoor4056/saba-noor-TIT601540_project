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
      title: 'Ai Lie Detection System',
      home: const MobileScreen(),
    );
  }
}

class MobileScreen extends StatelessWidget {
  const MobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],

      body: Center(
        child: Container(
          width: 380, // 📱 phone screen width
          height: 800,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
              ),
            ],
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

class _HomePageState extends State<HomePage> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // 🖼 IMAGE SECTION
            Center(
              child: Image.network(
                "https://cdn-icons-png.flaticon.com/512/4712/4712109.png",
                height: 120,
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              "AI Based Multi-Cue Lie Detection",
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

            // 💬 MESSAGE FIELD
            TextField(
              controller: messageController,
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

            // 🎯 DETECTION BUTTON
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.search),
                label: const Text("Analyze Truth / Lie"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 📊 ICON FEATURES
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [

                Column(
                  children: [
                    Icon(Icons.face, size: 40, color: Colors.green),
                    Text("Face"),
                  ],
                ),

                Column(
                  children: [
                    Icon(Icons.mic, size: 40, color: Colors.orange),
                    Text("Voice"),
                  ],
                ),

                Column(
                  children: [
                    Icon(Icons.accessibility, size: 40, color: Colors.red),
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