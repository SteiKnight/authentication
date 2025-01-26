import 'package:authentication/components/alternative_login.dart';
import 'package:authentication/components/input_box.dart';
import 'package:authentication/components/my_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  void Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  bool matchVisibility = false;

  final confirmPasswordController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserUp() async {
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

    //try signup
    try {
      //check if password is same as confirm
      if (confirmPasswordController.text == passwordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        setState(() {
          matchVisibility = true;
        });
      }

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

  void googleLogin() {}

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
          height: 25,
        ),
        //logo
        const Icon(
          Icons.lock,
          size: 80,
        ),

        const SizedBox(height: 25),
        //welcome text
        Text(
          'Let\'s Create an account for you!',
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
        InputBox(
          controller: passwordController,
          obscuredText: true,
          hintText: 'Password',
        ),

        SizedBox(height: 10),
        //password
        InputBox(
          controller: confirmPasswordController,
          obscuredText: true,
          hintText: 'Confirm Password',
        ),

        SizedBox(height: 10),
        Visibility(
          visible: matchVisibility,
          child: Text(
            'Passwords do not match!',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        ),

        SizedBox(height: 25),

        //signup button
        MyButton(text: 'Sign Up', onTap: signUserUp),

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
            Text('Already have an account?'),
            SizedBox(width: 4),
            GestureDetector(
              onTap: widget.onTap,
              child: Text(
                'Sign In',
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
