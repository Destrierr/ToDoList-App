import 'package:flutter/material.dart';

class TaskCard  extends StatelessWidget{
  final String title;
  final int tasks;
  // final IconData icon;
  final Color color;
  final VoidCallback onTap;
  final String imagePath; 

  const TaskCard({
    super.key,
    required this.title,
    required this.tasks,
    // required this.icon,
    required this.imagePath,
    this.color = Colors.blue,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0)),
        elevation: 4,
        child: ListTile(
          contentPadding: const EdgeInsets.all(16.0),
          onTap: onTap,
          leading: Container(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              imagePath,
              width: 40,
              height: 40,
            ),
          ),
            title: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text('$tasks Tasks'),
            trailing: const Icon(Icons.more_vert),
          ),
        );
    }
  }
