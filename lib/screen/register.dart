import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatelessWidget {
  const Register({super.key});
  @override
  Widget build(BuildContext context) {
    final userPassword = TextEditingController();
    final userEmail = TextEditingController();
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 300),
      child: Center(
        child: Column(
          children: [
            Text("Register"),
            TextField(
              decoration: InputDecoration(hintText: 'Email'),
              controller: userEmail,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Password'),
              controller: userPassword,
            ),
            IconButton(
                onPressed: () async {
                  try {
                    UserCredential userCredential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: userEmail.text, password: userPassword.text);
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      print('The password provided is too weak.');
                    } else if (e.code == 'email-already-in-use') {
                      print('The account already exists for that email.');
                    }
                  } catch (e) {
                    print(e);
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
    ));
  }
}
