import 'package:flutter/material.dart';
import 'package:flutter_learing_codepur/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog app'),
      ),
      body: Center(
        child: Text('Welcome to 30 days of flutter'),
      ),
      drawer: MyDrawer(),
    );
  }
}