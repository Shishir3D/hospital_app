import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/my_textfields.dart';
import '../components/my_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text Editing Controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  // Sign user in
  void signUserIn() async {
    // show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
        wrongEmailMessage();
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
        wrongPasswordMessage();
      }
    }
  }

  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text("Incorrect Email"),
        );
      },
    );
  }

  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text("Incorrect Password"),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 247, 247),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // hospital logo
              Image.asset(
                'lib/images/hospital.png',
                height: 80,
              ),

              // welcome back text
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Welcome Back',
                style: TextStyle(
                  color: Color.fromARGB(255, 199, 199, 199),
                ),
              ),

              //Text Fields
              const SizedBox(
                height: 60,
              ),
              MyTextfields(
                controller: emailController,
                hintText: 'Username',
                obscure: false,
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextfields(
                controller: passwordController,
                hintText: 'Password',
                obscure: true,
              ),

              // Forgot Password
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.blueGrey),
                    )
                  ],
                ),
              ),

              // Sign In Button
              const SizedBox(
                height: 20,
              ),
              MyButton(
                onTap: signUserIn,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
