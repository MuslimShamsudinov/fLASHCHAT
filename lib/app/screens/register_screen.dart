import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:muslim/app/appBar_helper/app_bar_container.dart';
import 'package:muslim/app/constants/constants.dart';
import 'package:muslim/app/resources/buttons/my_textfield.dart';
import 'package:muslim/app/resources/buttons/register_button.dart';
import 'package:muslim/app/resources/buttons/textfield_helper/my_textfield.dart';
import 'package:muslim/app/screens/home_screen.dart';

import 'package:muslim/app/screens/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);
  static const String route = 'register';

  @override
  _RegisterScreen createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  final username = TextEditingController();
  final password = TextEditingController();
  final user = TextEditingController();
  String id = '1334564768567';
  final users = FirebaseFirestore.instance.collection('users');
  Future<void> adduser() {
    return users
        .add({
          'name': user.text,
          'email': username.text,
          'password': password.text,
          'id': id
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  void signUp() async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: username.text,
            password: password.text,
          )
          .then((value) => {adduser()});
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
      } else if (e.code == 'email-already-in-use') {}
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: cRegisterColor.withOpacity(0.6),
        body: Column(
          children: [
            // AppBar
            AppBarContainer(
              label: 'Register',
              color: cRegisterColor,
              definition: 'Fill up your details to register.',
            ),
            //email
            const SizedBox(
              height: 50,
            ),
            MyTextField(
              controller: user,
              keyboardType: TextInputType.emailAddress,
              labelText: 'user',
              obscureText: false,
              hintText: 'enter your username',
            ),
            cSizedBox50,
            MyTextField(
              controller: username,
              keyboardType: TextInputType.emailAddress,
              labelText: 'email',
              obscureText: false,
              hintText: 'enter your email',
            ),
            //password          cSizedBox50,
            // MyTextField(

            //   keyboardType: TextInputType.emailAddress,
            //   labelText: 'email',
            //   obscureText: true,
            //   hintText: 'enter your email',
            // ),
            cSizedBox50,
            MyTextField(
              controller: password,
              keyboardType: TextInputType.visiblePassword,
              labelText: 'password',
              obscureText: true,
              hintText: 'enter your password',
            ),
            // mobi

            // Login button
            const Expanded(child: cSizedBox50),
            RegisterButton(
                title: 'Register',
                color: Colors.grey[900],
                onTap: () {
                  signUp();
                  Navigator.pushNamed(context,Homescreen.route);
                }),

            cSizedBox20,
            // Text
            BottomTitle(
                title: 'Already have an account ',
                titleButton: 'Login',
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.route);
                }),
          ],
        ),
      ),
    );
  }
}
// Create a Form widget.
