import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final userEmail = TextEditingController();
    final userPassword = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 300),
        child: Center(
            child: Column(
          children: [
            Text('Login'),
            TextField(
              decoration: InputDecoration(hintText: 'Email'),
              controller: userEmail,
            ),
            TextField(
                decoration: InputDecoration(hintText: 'Password'),
                controller: userPassword),
            IconButton(
                onPressed: () async {
                  try {
                    UserCredential userCredential = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: userEmail.text, password: userPassword.text);
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
        )),
      ),
    );
  }
}
