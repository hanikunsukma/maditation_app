import 'package:flutter/material.dart';

void main() {
  runApp(const MoodApp());
}

class MoodApp extends StatelessWidget {
  const MoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MoodScreen(),
    );
  }
}

class MoodScreen extends StatefulWidget {
  const MoodScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MoodScreenState createState() => _MoodScreenState();
}

class _MoodScreenState extends State<MoodScreen> {
  int _selectedMood = 4; // Default to "Happy"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade900,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "How Do You Feel Today?",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            CircleAvatar(
              radius: 80,
              backgroundColor: Colors.yellow,
              child: Icon(
                _moodIcons[_selectedMood],
                color: Colors.black,
                size: 80,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(_moodIcons.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedMood = index;
                    });
                  },
                  child: Column(
                    children: [
                      Icon(
                        _moodIcons[index],
                        color: _selectedMood == index
                            ? Colors.yellow
                            : Colors.grey,
                        size: 40,
                      ),
                      Text(
                        _moodLabels[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Note mood action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors
                    .purpleAccent, // Updated from primary to backgroundColor
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              ),
              child: const Text(
                "Note Mood",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepPurple.shade900,
        selectedItemColor: Colors.purpleAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.today), label: "Today"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Therapy"), // Changed Icon
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

const List<IconData> _moodIcons = [
  Icons.sentiment_very_dissatisfied, // Unhappy
  Icons.sentiment_dissatisfied, // Sad
  Icons.sentiment_neutral, // Normal
  Icons.sentiment_satisfied, // Good
  Icons.sentiment_very_satisfied, // Happy
];

const List<String> _moodLabels = [
  "Unhappy",
  "Sad",
  "Normal",
  "Good",
  "Happy",
];
