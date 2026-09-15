import 'package:flutter/material.dart';
import 'package:flutter_learing_codepur/utils/routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 40, top: 40),
              child: Image.asset('assets/images/login.png', fit: BoxFit.cover),
            ),
            SizedBox(height: 20),
            Text(
              'Welcome',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter Username',
                      labelText: 'Username',
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Enter Password',
                      labelText: 'Password',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print('Hi codepur');
                Navigator.pushNamed(context, MyRoutes.homeRoute);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(150, 48),
                padding: const EdgeInsets.symmetric(horizontal: 24),
              ),
              child: Text('Login', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
