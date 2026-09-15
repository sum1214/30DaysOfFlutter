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
  final _formKey = GlobalKey<FormState>();

  movetoHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        widget.changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      Navigator.pushNamed(context, MyRoutes.homeRoute).then((_) {
        setState(() {
          widget.changeButton = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 40, top: 40),
                child: Image.asset(
                  'assets/images/login.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Welcome ${widget.name}',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Username can not be empty';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Enter Password',
                        labelText: 'Password',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password can not be empty';
                        } else if (value.length < 6) {
                          return 'password length should be atleast 6';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Material(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(
                  widget.changeButton ? 50 : 8,
                ),
                child: InkWell(
                  onTap: () async {
                    movetoHome(context);
                  },
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    height: 50,
                    width: widget.changeButton ? 50 : 150,
                    alignment: Alignment.center,
                    // decoration: BoxDecoration(
                    //   color: Colors.deepPurple,
                    //   // borderRadius: BorderRadius.circular(8),
                    //   shape: widget.changeButton?BoxShape.circle:BoxShape.rectangle
                    // ),
                    child: !widget.changeButton
                        ? Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )
                        : Icon(Icons.done, color: Colors.white),
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
      ),
    );
  }
}
