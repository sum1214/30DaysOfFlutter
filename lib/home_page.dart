import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catlog app'),
      ),
      body: Center(
        child: Text('Welcome to 30 days of flutter'),
      ),
      drawer: Drawer(),
    );
  }
}