import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final imageUrl = 'https://img.icons8.com/ultraviolet/1200/user.jpg';
    final imagePath = 'assets/images/profile.png';
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // DrawerHeader hardcodes a bottom border from the divider colour,
            // so hide it to blend with the container.
            DividerTheme(
              data: DividerThemeData(color: Colors.transparent),
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                decoration: BoxDecoration(color: Colors.deepPurple),
                accountName: Text('Shubham Kumar',style: TextStyle(color: Colors.white),),
                accountEmail: Text('shubhamkumar805140@gmail.com',style: TextStyle(color: Colors.white)),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage(imagePath),
                ),
              ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.home, color: Colors.white),
              title: Text('Home', style: TextStyle(color: Colors.white),textScaler: TextScaler.linear(1.2)),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.profile_circled, color: Colors.white),
              title: Text('Profile', style: TextStyle(color: Colors.white),textScaler: TextScaler.linear(1.2)),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.mail, color: Colors.white),
              title: Text('Email', style: TextStyle(color: Colors.white),textScaler: TextScaler.linear(1.2)),
            ),
          ],
        ),
      ),
    );
  }
}
