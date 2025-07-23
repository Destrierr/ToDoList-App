import 'package:flutter/material.dart';
import 'task_card.dart';

class HomeScreen extends StatelessWidget {
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

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        backgroundColor: Colors.yellow[100],
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          
          children: [
            // Profl Pengguna
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
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                              Text('Today you have 4 task', style: TextStyle(fontSize: 14)),
                            ],
                          ),
                          // Poto Profil
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
                      ),
                    );
                  }
                }
                        