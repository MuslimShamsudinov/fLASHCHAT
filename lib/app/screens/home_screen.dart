import 'package:flutter/material.dart';
import 'package:muslim/app/screens/introduction_screen.dart';
import 'package:muslim/app/screens/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
    static const String route = 'Chat';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar( 
        backgroundColor: Colors.red,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
        centerTitle: true,
        title: Text('WELCOME'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: TextButton(
              onPressed: () => Navigator.pushNamed(context,LoginScreen.route),
              child: Text(
                'log out',
                style: TextStyle(fontSize: 28, color: Colors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
