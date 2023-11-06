import 'package:chatmessenger/Login_or_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chatmessenger/Homepage.dart';
class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder:(context,snapshot) {
    if(snapshot.hasData){
    return const Homepage();
    }
    else{
    return const LoginOrRegister();
    }
    }

      ),
    );
  }
}
