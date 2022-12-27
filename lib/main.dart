import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:practice/screen/login.dart';
import 'package:practice/screen/register.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("MyApp"),
            backgroundColor: Colors.amber,
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Center(
                child: Column(children: [
              Text('HomePage', style: TextStyle(fontSize: 22)),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                child: const Text(
                  'Register',
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Register()),
                  );
                },
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                child: const Text('Login'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
              ),
            ])),
          ),
        ));
  }
}
