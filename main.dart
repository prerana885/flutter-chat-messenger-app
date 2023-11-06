import 'dart:js';

import 'package:chatmessenger/firebase_options.dart';
import 'package:chatmessenger/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:chatmessenger/Loginpage.dart';
import 'package:provider/provider.dart';
import 'auth_gate.dart';
import 'auth_service.dart';
import 'Login_or_register.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
      ChangeNotifierProvider(
          create: (context)=>AuthService(),
    child: const MyApp(),
      ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
    );
  }
}


              
