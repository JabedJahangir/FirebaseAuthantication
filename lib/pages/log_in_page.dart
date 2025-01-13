import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetask2/Widgets/my_button.dart';
import 'package:firebasetask2/Widgets/my_text_field.dart';
import 'package:firebasetask2/Widgets/square_tile.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatelessWidget {
  LogInPage({super.key});
  //text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  //sign in method
  void userSignIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                //logo

                Icon(
                  Icons.lock,
                  size: 100,
                ),

                const SizedBox(
                  height: 25,
                ),

                //Welcome back, You were Missses!!
                Text(
                  'Welcome! You\'ve been missed!',
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
                const SizedBox(
                  height: 25,
                ),

                //username Textfield
                MyTextField(
                  hintText: 'Email or Phone Number',
                  obscure: false,
                  controller: emailController,
                ),
                const SizedBox(
                  height: 25,
                ),
                //password Textfield
                MyTextField(
                  hintText: 'Password',
                  obscure: true,
                  controller: passwordController,
                ),
                const SizedBox(
                  height: 10,
                ),

                //forgot Password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),

                //sign in button
                MyButton(
                  onTap: userSignIn,
                ),

                //or continue with

                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(
                          child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'or continue with',
                          style:
                              TextStyle(fontSize: 16, color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                          child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),

                //google+apple login option

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(imagePath: 'lib/Images/google.png'),
                    SizedBox(
                      width: 10,
                    ),
                    SquareTile(imagePath: 'lib/Images/apple.png'),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                //new here ? Register now!
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a memeber?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      'Register now!',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue),
                    )
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
