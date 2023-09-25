import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:notesapp/dash/landing_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  bool login = false;

  @override
  void initState() {
    checkIfLoggedIn();
  }

  void checkIfLoggedIn() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print("No Users");
      } else {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const LandingScreen(),
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Gap(50),
                  Text("Welcome", style: TextStyle(fontSize: 32)),
                  Gap(30),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(hintText: "Username"),
                            onSaved: (value) {
                              setState(() {
                                email = value!;
                              });
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Email cannot be empty";
                              } else {
                                return null;
                              }
                            },
                          ),
                          Gap(20),
                          TextFormField(
                            decoration: InputDecoration(hintText: "Password"),
                            onSaved: (value) {
                              setState(() {
                                password = value!;
                              });
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Password cannot be empty";
                              } else {
                                return null;
                              }
                            },
                          ),
                          Gap(40),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  try{
                                    await FirebaseAuth.instance
                                        .signInWithEmailAndPassword(
                                        email: email, password: password);
                                    print("Success");
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text("Login Success Full"))
                                    );
                                  }on FirebaseAuthException catch(e){
                                    print("Error: "+e.message!);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(e.message!))
                                    );
                                  }

                                }
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const LandingScreen(),
                                ));
                              },
                              child: Text(
                                "LOGIN",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      )),
                  Gap(20),
                  TextButton(onPressed: () {}, child: Text("Forgot Password?"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
