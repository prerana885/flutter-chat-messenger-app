import 'package:chatmessenger/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my_button.dart';
import 'my_textfield.dart';
class Loginpage extends StatefulWidget {
  final void Function()? onTap;
  const Loginpage({ super.key, required this.onTap});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> signIn() async {
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
await authService.signInWithEmailandPasswpord(
    emailController.text,
    passwordController.text,
);
    }
    catch(e){
ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(e.toString(),
),
),
);
    }


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
               //logo
               Icon(
                 Icons.message,
                 size: 100,
                 color: Colors.grey,
               ) ,
  const SizedBox(height: 25),
  const  Text(
       "Welcome back you\'ve been missed",
   style:TextStyle(
     fontSize: 16,
   ),
        ),
                const SizedBox(height: 10),
                MytextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                const SizedBox(height: 25),
                MytextField(
                    controller: passwordController,
                    obscureText: true,
                    hintText: 'Password',
                ),
                const SizedBox(height: 25),
          Mybutton(onTap: signIn,text: "sign in"),
              const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not a member?'),
                    const SizedBox(width:4 ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child:const Text(
                          'Register now',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                  ],
                )

              ],

            ),
          ),
        ),
      ),
    );
  }
}
