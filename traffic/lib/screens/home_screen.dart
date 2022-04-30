//import 'dart:ffi';
//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:traffic/model/user_model.dart';
import 'package:traffic/screens/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome ${loggedInUser.firstName}",
          style: const TextStyle(
            color: Colors.white,
          ),
          //textAlign: TextAlign.center,
        ),
        centerTitle: true,

        //backgroundColor: Colors.transparent,
        backgroundColor: Color.fromARGB(255, 3, 43, 77),

        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
            size: 40,
          ),
          onPressed: () {
            //Navigator.push(context, MaterialPageRoute(builder: (context) => RootScreen()));
            //Navigator.of(context).pop();
          },
        ),
        //backgroundColor:const Color.fromARGB(255, 3, 43, 77),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "welcome back",
                style:
                    TextStyle(fontWeight: FontWeight.w600, color: Colors.red),
              ),
              Text(
                "${loggedInUser.emailId} ${loggedInUser.lastName} ${loggedInUser.firstName}",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.blueAccent),
              ),
              Text(
                "email ",
                style:
                    TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
              ),
              SizedBox(
                height: 20,
              ),
              ActionChip(
                label: const Text("logout"),
                onPressed: () {
                  logout(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
