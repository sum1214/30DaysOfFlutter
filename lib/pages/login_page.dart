import 'package:flutter/material.dart';
import 'package:flutter_learing_codepur/utils/routes.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});
  String name = "";
  bool changeButton = false;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              'Welcome ${widget.name}',
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
                    onChanged: (value) {
                      widget.name = value;
                      setState(() {});
                    },
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
            InkWell(
              onTap: () async {
                setState(() {
                  widget.changeButton = true;
                });
                await Future.delayed(Duration(seconds: 1));
                Navigator.pushNamed(context, MyRoutes.homeRoute);
              },
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                height: 50,
                width: widget.changeButton?100:150,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  // borderRadius: BorderRadius.circular(8),
                  shape: widget.changeButton?BoxShape.circle:BoxShape.rectangle
                ),
                child: !widget.changeButton?
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )
                :
                Icon(
                  Icons.done,
                  color: Colors.white,
                ),
              ),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     print('Hi codepur');
            //     Navigator.pushNamed(context, MyRoutes.homeRoute);
            //   },
            //   style: ElevatedButton.styleFrom(
            //     minimumSize: const Size(150, 48),
            //     padding: const EdgeInsets.symmetric(horizontal: 24),
            //   ),
            //   child: Text('Login', style: TextStyle(fontSize: 18)),
            // ),
          ],
        ),
      ),
    );
  }
}
