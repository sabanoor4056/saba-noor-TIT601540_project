import 'package:flutter/material.dart';
import 'api/api_service.dart';
import 'model/user_model.dart';

void main() {
  runApp(const LieSenseApp());
}

class LieSenseApp extends StatelessWidget {
  const LieSenseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const PhoneFrame(),
    );
  }
}

/* 📱 PHONE UI FRAME */
class PhoneFrame extends StatelessWidget {
  const PhoneFrame({super.key});

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
            borderRadius: BorderRadius.circular(25),
          ),
          child: const HomePage(),
        ),
      ),
    );
  }
}

/* 🧠 HOME PAGE */
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiService apiService = ApiService();
  List<UserModel> users = [];
  bool loading = false;

  void loadUsers() async {
    setState(() => loading = true);

    try {
      users = await apiService.fetchUsers();
    } catch (e) {
      print(e);
    }

    setState(() => loading = false);
  }

  @override
  void initState() {
    super.initState();
    loadUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lie Sense AI"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),

      body: Column(
        children: [

          const SizedBox(height: 10),

          const Text(
            "API Integrated (Users Data)",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          if (loading)
            const CircularProgressIndicator(),

          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];

                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.person),
                    title: Text(user.name),
                    subtitle: Text(user.email),
                  ),
                );
              },
            ),
          ),

          const Divider(),

          // 🔥 Your Lie Sense Feature Section
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: const [
                Text(
                  "Lie Detection Modules",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.face, color: Colors.green),
                    Icon(Icons.mic, color: Colors.orange),
                    Icon(Icons.accessibility, color: Colors.red),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}