import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:steps_core/steps_core.dart';

void main() {
  runApp(const StepsApp());
}

class StepsApp extends StatelessWidget {
  const StepsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Steps Manager',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Steps Manager'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to Steps Manager!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Your personal step-by-step task organizer',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 32),
            Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Icon(Icons.privacy_tip, size: 48, color: Colors.green),
                    SizedBox(height: 8),
                    Text(
                      'Privacy First',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'All your data stays on your device.\nNo data is sent to external servers.',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Implement add task functionality
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Task creation coming soon!'),
            ),
          );
        },
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
    );
  }
}