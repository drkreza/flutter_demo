import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_project/firebase_options.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Firebase Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    home: const MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final TextEditingController email;
  late final TextEditingController password;

  @override
  void initState() {
    email = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
           TextField(
            decoration: const InputDecoration(
              hintText: "enter your email",
            ),
            autocorrect: false,
            enableSuggestions: false,
            controller: email,
          ),
           TextField(
            decoration: const InputDecoration(hintText: "enter your password"),
            autocorrect: false,
            enableSuggestions: false,
            obscureText: true,
            controller: password,
          ),
          TextButton(onPressed: () async {

            var _email = email.text;
            var _password = password.text;

            await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

            var userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
            print(userCredential);


          }, child: const Text("Register User"),)
        ],
      ),
    );
  }
}
