import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetask2/Widgets/my_button.dart';
import 'package:firebasetask2/Widgets/my_text_field.dart';
import 'package:firebasetask2/Widgets/square_tile.dart';
import 'package:firebasetask2/services/auth_services.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key, required this.onTap});
  final Function()? onTap;

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  //text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  //sign in method
  void userSignIn() async {
    // Show a loading circle (block interaction until done)
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      // Try signing in
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Pop the loading circle after successful sign-in
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // Pop the loading circle before showing the error
      Navigator.pop(context);

      // Show error dialog based on specific error codes
      if (e.code == 'user-not-found') {
        // Show wrong email error
        wrongEmail();
      } else if (e.code == 'wrong-password') {
        // Show wrong password error
        wrongPassword();
      } else {
        // Show a generic error message for any other error
        showErrorDialog(e.message ?? 'An unexpected error occurred.');
      }
    }
  }

  // Wrong Email Alert
  void wrongEmail() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Wrong Email!'),
          content: const Text('The email you entered does not exist.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Wrong Password Alert
  void wrongPassword() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Wrong Password!'),
          content: const Text('The password you entered is incorrect.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // General Error Dialog
  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
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
                const SizedBox(height: 50),
                Icon(
                  Icons.lock,
                  size: 100,
                ),
                const SizedBox(height: 25),
                Text(
                  'Welcome! You\'ve been missed!',
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
                const SizedBox(height: 20),

                // Username TextField
                MyTextField(
                  hintText: 'Email or Phone Number',
                  obscure: false,
                  controller: emailController,
                ),
                const SizedBox(height: 15),

                // Password TextField
                MyTextField(
                  hintText: 'Password',
                  obscure: true,
                  controller: passwordController,
                ),
                const SizedBox(height: 10),

                // Forgot Password
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
                const SizedBox(height: 15),

                // Sign In Button
                MyButton(
                  text: 'Sign In',
                  onTap: userSignIn,
                ),

                // Or continue with
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
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
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),

                // Google + Apple login options
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(
                        onTap: () => AuthServices().signInWithGoogle(),
                        imagePath: 'lib/Images/google.png'),
                    SizedBox(width: 10),
                    SquareTile(onTap: () {}, imagePath: 'lib/Images/apple.png'),
                  ],
                ),
                const SizedBox(height: 20),

                // Register now prompt
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        'Register now!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
