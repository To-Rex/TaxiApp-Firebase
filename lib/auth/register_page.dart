import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _SampesPageState createState() => _SampesPageState();
}

class _SampesPageState extends State<RegisterPage> with SingleTickerProviderStateMixin {
  final _email = TextEditingController();
  final _password = TextEditingController();


  final _auth = FirebaseAuth.instance;


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  /*void registerUser(String email, String password) async {
    *//*if (Platform.isAndroid) {
      try{
        await _auth.createUserWithEmailAndPassword(email: email, password: password);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }
    // if platform ios
    if (Platform.isIOS) {
      await Firebase.initializeApp();
      try{
        await _auth.createUserWithEmailAndPassword(email: email, password: password);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }*//*


  }*/

  //phone auth register user
  Future<void> phoneAuth

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0), // here the desired height
        child: AppBar(
          backgroundColor: const Color.fromRGBO(33, 158, 188, 10),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //firebase auth email and password
          //text fild email
          TextField(
            controller: _email,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          //text fild password
          TextField(
            controller: _password,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          ),

          SizedBox(
            height: 10,
          ),
          //text submit button
          ElevatedButton(
            onPressed: () {
              //firebase auth email and password register user
              //registerUser(_email.text, _password.text);
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}