// ignore: file_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:traffic/screens/admin_screen.dart';
import 'package:traffic/screens/login_screen.dart';
import 'package:traffic/screens/register_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  Widget build(BuildContext context) {
    final _logo = Material(
      shape: const CircleBorder(),
      child: InkWell(
        splashColor: const Color.fromARGB(150, 2, 45, 80),
        onTap: () {},
        child: Ink.image(
          image: const AssetImage('assets/Hawk_eye_facebook.jpg'),
          height: 200,
          width: 200,
          fit: BoxFit.cover,
        ),
      ),
    );
    final _login = Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(30),
      color: const Color.fromARGB(200, 2, 45, 80),
      child: MaterialButton(
        padding: const EdgeInsets.all(20.0),
        minWidth: double.infinity,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        },
        child: const Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
    final _singup = Material(
      elevation: 15,
      borderRadius: BorderRadius.circular(30),
      color: const Color.fromARGB(230, 2, 45, 80),
      child: MaterialButton(
        padding: const EdgeInsets.all(20.0),
        minWidth: double.infinity,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => RegistrationScreen()));
        },
        child: const Text(
          "Sign Up",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
    final _admin = Material(
      elevation: 20,
      shadowColor: const Color.fromARGB(255, 2, 45, 80),
      borderRadius: BorderRadius.circular(30),
      color: const Color.fromARGB(255, 2, 45, 80),
      child: MaterialButton(
        padding: const EdgeInsets.all(20.0),
        minWidth: double.infinity,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AdminScreen()));
        },
        child: const Text(
          "Admin",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _logo,
                const SizedBox(
                  height: 30,
                ),
                _login,
                const SizedBox(
                  height: 10,
                ),
                _singup,
                const SizedBox(
                  height: 10,
                ),
                _admin
              ],
            ),
          ),
        ),
      ),
    );
  }
}
