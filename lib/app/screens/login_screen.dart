import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:muslim/app/appBar_helper/app_bar_container.dart';
import 'package:muslim/app/constants/constants.dart';
import 'package:muslim/app/resources/buttons/my_textfield.dart';
import 'package:muslim/app/resources/buttons/register_button.dart';
import 'package:muslim/app/resources/buttons/textfield_helper/my_textfield.dart';
import 'package:muslim/app/screens/home_screen.dart';
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
  final _formfield = GlobalKey<FormState>();
  bool passToggle = true;

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Wrong Password.'),
                // Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.pushNamed(context, RegisterScreen.route);
              },
            ),
          ],
        );
      },
    );
  }

  void signIn() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: username.text, password: password.text)
          .then((value) => Navigator.pushNamed(context, Homescreen.route));
    } on FirebaseAuthException catch (e) {
      print(e.code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: cLoginColor.withOpacity(0.6),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: Form(
              key: _formfield,
              child: Column(
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
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: username,
                    decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                        prefix: Icon(Icons.email)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'enter email ';
                      }
                      bool emailvalid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value);
                      if (!emailvalid) {
                        return 'Enter Valid  email';
                      }
                    },
                  ),
                  //password
                  cSizedBox50,
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: password,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                        prefix: Icon(Icons.lock),
                        suffix: InkWell(
                          onTap: () {
                            setState(() {
                              passToggle = !passToggle;
                            });
                          },
                          child: Icon(passToggle
                              ? Icons.visibility
                              : Icons.visibility_off),
                        )),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'enter password';
                      } else if (password.text.length < 6) {
                        return 'Password length Should be more than 6 characters ';
                      }
                    },
                  ),
                  // MyTextField(
                  //   controller: password,
                  //   keyboardType: TextInputType.visiblePassword,
                  //   labelText: 'password',
                  //   obscureText: true,
                  //   hintText: 'enter your password',
                  // ),
                  // Login button
                  cSizedBox50,
                  RegisterButton(
                      title: 'Login',
                      color: Colors.red,
                      onTap: () {
                        if (_formfield.currentState!.validate()) {
                          print('Succes');
                          username.clear();
                          password.clear();
                          Navigator.pushNamed(context, Homescreen.route);
                          signIn();
                        }
                      }),
                  cSizedBox20,
                  // Text Don't have an account
                  BottomTitle(
                    title: 'Don\'t have an account',
                    titleButton: 'Register',
                    onPressed: () =>
                        Navigator.pushNamed(context, RegisterScreen.route),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
