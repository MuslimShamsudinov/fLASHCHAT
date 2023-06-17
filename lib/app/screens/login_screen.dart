import 'package:flutter/material.dart';
import 'package:muslim/app/appBar_helper/app_bar_container.dart';
import 'package:muslim/app/constants/constants.dart';
import 'package:muslim/app/resources/buttons/my_textfield.dart';
import 'package:muslim/app/resources/buttons/register_button.dart';
import 'package:muslim/app/resources/buttons/textfield_helper/my_textfield.dart';
import 'package:muslim/app/screens/home_screen.dart';
import 'package:muslim/app/screens/introduction_screen.dart';
import 'package:muslim/app/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);
    static const String route = 'login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final username = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: cLoginColor.withOpacity(0.6),
        body: Column(
          children: [
            // AppBar
            AppBarContainer(
              label: 'Login',
              color: cLoginColor,
              definition: 'Enter your parametrs to continue',
            ),
            //email
            const SizedBox(
              height: 100,
            ),
            MyTextField(
              controller: username,
              keyboardType: TextInputType.emailAddress,
              labelText: 'username',
              obscureText: false,
              hintText: 'enter your username',
            ),
            //password
            cSizedBox50,
            MyTextField(
              controller: password,
              keyboardType: TextInputType.visiblePassword,
              labelText: 'password',
              obscureText: true,
              hintText: 'enter your password',
            ),
            // Login button
            const Expanded(child: cSizedBox50),
            RegisterButton(
                title: 'Login',
                color: Colors.grey[900],
                onTap: () {
                  Navigator.pushNamed(context, IntroductionScreen.route);
                }),
            cSizedBox20,
            // Text Don't have an account
            BottomTitle(
              title: 'Don\'t have an account',
              titleButton: 'Register',
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RegisterScreen())),
            ),
          ],
        ),
      ),
    );
  }
}
