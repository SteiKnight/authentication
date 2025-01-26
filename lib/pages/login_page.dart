import 'package:authentication/components/alternative_login.dart';
import 'package:authentication/components/input_box.dart';
import 'package:authentication/components/my_button.dart';
import 'package:authentication/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  void Function()? onTap;
  LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  void signUserIn() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(
            color: Colors.blue,
          ),
        );
      },
    );

    //sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      //pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //pop the loading circle
      Navigator.pop(context);

      if (e.code == 'invalid-credential') {
        showErrMessage(e.code);
      } else if (e.code == 'invalid-email') {
        showErrMessage(e.code);
      }
    }
  }

  void showErrMessage(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.deepOrange,
        title: Center(
          child: Text(
            message,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  void appleLogin() {}

  void googleLogin() {
    AuthService().signInWithGoogle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(child: column()),
        ),
      ),
    );
  }

  Column column() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 50,
        ),
        //logo
        const Icon(
          Icons.lock,
          size: 80,
        ),

        const SizedBox(height: 50),
        //welcome text
        Text(
          'Welcome back you\'ve been missed!',
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 16,
          ),
        ),

        const SizedBox(height: 25),
        //username
        InputBox(
          controller: emailController,
          obscuredText: false,
          hintText: 'Email',
        ),

        SizedBox(height: 10),
        //password
        InputBox(
          controller: passwordController,
          obscuredText: true,
          hintText: 'Password',
        ),

        SizedBox(height: 10),

        //forgot password

        Padding(
          padding: const EdgeInsets.only(
            right: 25,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Forgot Password?',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          ),
        ),

        SizedBox(height: 25),

        //sign in button
        MyButton(text: 'Sign In', onTap: signUserIn),

        SizedBox(height: 50),

        //continue with
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(children: [
            Expanded(
              child: Divider(
                thickness: 0.5,
                color: Colors.grey[400],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'Or continue with',
                style: TextStyle(color: Colors.grey[700]),
              ),
            ),
            Expanded(
              child: Divider(
                thickness: 0.5,
                color: Colors.grey[400],
              ),
            ),
          ]),
        ),
        SizedBox(
          height: 25,
        ),
        //google + apple sign in buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AlternativeLogin(
                imagePath: 'lib/images/google.png', onTap: googleLogin),
            SizedBox(width: 10),
            AlternativeLogin(
                imagePath: 'lib/images/apple.png', onTap: appleLogin),
          ],
        ),

        SizedBox(height: 25),

        //not a member register
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Not a member?'),
            SizedBox(width: 4),
            GestureDetector(
              onTap: widget.onTap,
              child: Text(
                'Register now',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
