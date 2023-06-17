import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:muslim/app/screens/home_screen.dart';
import 'package:muslim/app/screens/introduction_screen.dart';
import 'package:muslim/app/screens/login_screen.dart';
import 'package:muslim/app/screens/register_screen.dart';

import 'firebase_options.dart';

// ...

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute: IntroductionScreen.route,
     routes:{
    RegisterScreen.route:(context) =>RegisterScreen(),
       HomeScreen.route :(context) =>HomeScreen(),
       LoginScreen.route :(context) =>LoginScreen(),
     IntroductionScreen.route :(context) =>IntroductionScreen(),
      

         },

      home:  LoginScreen(),
    );
  }
}
