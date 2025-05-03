import 'package:flutter/material.dart';

void main() {
  runApp(TechGridApp());
}

class TechGridApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tech Grid View',
      debugShowCheckedModeBanner: false,
      home: TechGridScreen(),
    );
  }
}

class TechGridScreen extends StatelessWidget {
  final List<Map<String, dynamic>> techItems = [
    {'name': 'Python', 'icon': Icons.code},
    {'name': 'C++', 'icon': Icons.computer},
    {'name': 'Java', 'icon': Icons.coffee},
    {'name': 'Oracle', 'icon': Icons.storage},
    {'name': 'Dart', 'icon': Icons.flutter_dash},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Technologies')),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        itemCount: techItems.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 items per row
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          final item = techItems[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailScreen(techName: item['name']),
                ),
              );
            },
            child: Card(
              elevation: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(item['icon'], size: 50, color: Colors.blue),
                  SizedBox(height: 10),
                  Text(item['name'], style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String techName;

  const DetailScreen({Key? key, required this.techName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(techName)),
      body: Center(
        child: Text(
          'Welcome to $techName!',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
