import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App English'),
      ),
      body: const Center(
        child: Text(
          'Hi, there!',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}