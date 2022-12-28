import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final userEmail = TextEditingController();
    final userPassword = TextEditingController();
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey,
          ),
          height: 400,
          width: 300,
          child: Container(
            padding: EdgeInsets.all(14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Login',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Email',
                  ),
                  controller: userEmail,
                ),
                TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText: 'Password'),
                    controller: userPassword),
                IconButton(
                    onPressed: () async {
                      try {
                        UserCredential userCredential = await FirebaseAuth
                            .instance
                            .signInWithEmailAndPassword(
                                email: userEmail.text,
                                password: userPassword.text);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          print('No user found for that email.');
                        } else if (e.code == 'wrong-password') {
                          print('Wrong password provided for that user.');
                        }
                      }
                    },
                    icon: Icon(Icons.login_outlined)),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Go back!'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
