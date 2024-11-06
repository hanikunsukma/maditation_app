import 'package:flutter/material.dart';
import 'therapy.dart';
import 'explore.dart'; // Mengimpor file explore.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // Daftar layar yang akan ditampilkan di IndexedStack
  final List<Widget> _screens = [
    const MeditationAppScreen(),
    const MoodScreen(),
    const ExploreScreen(), // Menambahkan layar ExploreScreen
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF2C2C2E),
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.today), label: "Today"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Therapy"),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Profile"),
        ],
      ),
    );
  }
}

class MeditationAppScreen extends StatelessWidget {
  const MeditationAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title:
            const Text("Today's Plan", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Enjoy your day, User",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16.0),
            // Contoh Kalender Sederhana
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(5, (index) {
                return Column(
                  children: [
                    Text(
                      "${12 + index}",
                      style: TextStyle(
                        color: index == 2 ? Colors.purple : Colors.grey,
                      ),
                    ),
                    Text(
                      ["Mon", "Tue", "Wed", "Thu", "Fri"][index],
                      style: TextStyle(
                        color: index == 2 ? Colors.purple : Colors.grey,
                      ),
                    ),
                  ],
                );
              }),
            ),
            const SizedBox(height: 16.0),
            // Kartu Aktivitas
            Expanded(
              child: ListView(
                children: [
                  _buildActivityCard(
                    title: "Breathing Exercise",
                    duration: "2 min",
                    imagePath: "assets/img/breathing_exercise.jpeg",
                  ),
                  _buildActivityCard(
                    title: "Yoga Class",
                    duration: "15 min",
                    imagePath: "assets/img/yoga_class.jpeg",
                  ),
                  _buildActivityCard(
                    title: "Guided Meditation",
                    duration: "10 min",
                    imagePath: "assets/img/guided_meditation.jpeg",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityCard({
    required String title,
    required String duration,
    required String imagePath,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.purpleAccent, Colors.deepPurple],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        leading: CircleAvatar(
          backgroundImage: AssetImage(imagePath),
          radius: 28,
        ),
        title: Text(
          title,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          duration,
          style: const TextStyle(color: Colors.white70),
        ),
      ),
    );
  }
}
