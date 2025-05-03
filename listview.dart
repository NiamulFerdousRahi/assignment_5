import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Languages List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LanguageListPage(),
    );
  }
}

class LanguageListPage extends StatelessWidget {
  final List<Map<String, dynamic>> languages = [
    {'name': 'Python', 'icon': Icons.code},
    {'name': 'C++', 'icon': Icons.memory},
    {'name': 'Java', 'icon': Icons.coffee},
    {'name': 'Oracle', 'icon': Icons.storage},
    {'name': 'Dart', 'icon': Icons.flutter_dash},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select a Language')),
      body: ListView.builder(
        itemCount: languages.length,
        itemBuilder: (context, index) {
          final language = languages[index];
          return ListTile(
            leading: Icon(language['icon'], color: Colors.blue),
            title: Text(language['name']),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) =>
                          LanguageDetailPage(languageName: language['name']),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class LanguageDetailPage extends StatelessWidget {
  final String languageName;

  LanguageDetailPage({required this.languageName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(languageName)),
      body: Center(
        child: Text(
          'Welcome to $languageName!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
