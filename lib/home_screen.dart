import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'task_card.dart';
import 'widgets/custom_drawer.dart';
import 'widgets/bottom_nav.dart';
import 'screens/add_task.dart';
import 'models/task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Map<String, dynamic>> categories = [
    {
      'title': 'Today',
      'tasks': 4,
      'image': 'assets/icons/alarm-clock.png',
      'color': Colors.orange,
    },
    {
      'title': 'Planned',
      'tasks': 2,
      'image': 'assets/icons/notebook.png',
      'color': Colors.red,
    },
    {
      'title': 'Personal',
      'tasks': 6,
      'image': 'assets/icons/id-card.png',
      'color': Colors.green,
    },
    {
      'title': 'Work',
      'tasks': 5,
      'image': 'assets/icons/briefcase.png',
      'color': Colors.blue,
    },
    {
      'title': 'Shopping',
      'tasks': 8,
      'image': 'assets/icons/calculator.png',
      'color': Colors.purple,
    },
  ];

  final List<Widget> _pages = [
    // Add your pages here
    const Center(child: Text('Beranda')),
    const Center(child: Text('Tugas')),
    const Center(child: Text('Notifikasi')), // Placeholder for Search
    const Center(child: Text('Profil')),
  ];

  void _onItemTapped(int index) {
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AddTaskScreen()),
      );
    } else {}
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        backgroundColor: Colors.yellow[100],
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            color: Colors.white,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: const CustomDrawer(),
      body: _currentIndex == 0
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  // Profile Pengguna
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Hello, Dezze',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Today you have 4 task',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        // Photo Profile
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('assets/img/girl.png'),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: categories.map((cat) {
                        return TaskCard(
                          title: cat['title'] ?? 'untitled',
                          tasks: cat['tasks'] ?? 0,
                          imagePath: cat['image'] ?? '',
                          color: cat['color'] ?? Colors.grey,
                          onTap: () {
                            // Handle tap
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            )
          : _pages[_currentIndex],
      bottomNavigationBar: BottomNav(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
