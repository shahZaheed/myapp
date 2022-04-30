//import 'dart:html';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:traffic/screens/admin_home_screen.dart';
import 'package:traffic/screens/home_screen.dart';
import 'package:traffic/screens/register_screen.dart';
import 'package:traffic/screens/root_screen.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  //firebase auth
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final _logo = Material(
      shape: const CircleBorder(),
      child: InkWell(
        splashColor: const Color.fromARGB(150, 2, 45, 80),
        onTap: () {},
        child: Ink.image(
          image: const AssetImage('assets/Hawk_eye_facebook.jpg'),
          height: 150,
          width: 150,
          fit: BoxFit.cover,
        ),
      ),
    );

    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please enter your Email");
        }
        //regex
        if (!RegExp("^[a-zA-z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please enter valid email");
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail_rounded),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Email',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    final passwordField = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: passwordController,
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return "Please enter your password";
        }
        if (!regex.hasMatch(value)) {
          return "Enter valid password(min. 6 character)";
        }
        return null;
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final loginBtn = Material(
      elevation: 10,
      color: const Color.fromARGB(255, 2, 45, 80),
      borderRadius: BorderRadius.circular(30),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        onPressed: () {
          //Navigator.pushReplacement(
          //context, MaterialPageRoute(builder: (context) => HomeScreen()));
          signIn(emailController.text, passwordController.text);
        },
        minWidth: MediaQuery.of(context).size.width,
        child: const Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
        appBar: AppBar(
          /* title: const Text(" Admin Login" ,style:
            TextStyle(
              color: const Color.fromARGB(255, 3, 43, 77),
            ),),*/
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 3, 43, 77),
            ),
            onPressed: () {
              //Navigator.push(context, MaterialPageRoute(builder: (context) => RootScreen()));
              Navigator.of(context).pop();
            },
          ),
          //backgroundColor:const Color.fromARGB(255, 3, 43, 77),
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 200,
                        child: Image.asset(
                          'assets/Hawk_eye_facebook.jpg',
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                        child: Text(
                          "Admin Login",
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                      emailField,
                      SizedBox(
                        height: 25,
                      ),
                      passwordField,
                      SizedBox(
                        height: 25,
                      ),
                      loginBtn,
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Forget Passoword? "),
                          GestureDetector(
                            onTap: () {
                              //Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistrationScreen()));
                            },
                            child: Text(
                              "Reset",
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  //singIn fun
  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      /*final _userList =
          await _auth.fetchSignInMethodsForEmail(emailController.text);

        if (_userList.isEmpty) {
          Fluttertoast.showToast(msg: "Please Register");
          Navigator.of(context).push(
              MaterialPageRoute(builder: ((context) => RegistrationScreen())));

        }*/
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: ((context) => AdminHomeScreen()))),
          Fluttertoast.showToast(msg: "Login successful"),
        });
      } catch (error) {
        Fluttertoast.showToast(msg: "Invalid credentials");
      }
    }
  }
}
