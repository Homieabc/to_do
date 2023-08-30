import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do/screens/to_do_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static Future<User?> loginUsingEmailAndPassword(
      {required String email,
      required String password,
      required BuildContext cox}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'User not found') {}
    }
    return user;
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'ToDoApp📚',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Please sign to continue',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 40.0),
          TextField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: 'User',
              prefixIcon: Icon(
                Icons.person_3_rounded,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: _passwordController,
            obscureText: isVisible,
            decoration: InputDecoration(
              hintText: 'Password',
              prefixIcon: const Icon(
                Icons.lock,
                color: Colors.black,
              ),
              suffixIcon: Visibility(
                visible: isVisible,
                child: IconButton(
                  onPressed: () {
                    if (isVisible == true) {
                      const Icon(Icons.visibility_off);
                    }

                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  icon: const Icon(Icons.visibility),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            'Do not remember your password?',
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
          const SizedBox(
            height: 70,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            width: double.infinity,
            child: RawMaterialButton(
              fillColor: Colors.green,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              onPressed: () async {
                User? user = await loginUsingEmailAndPassword(
                  email: _emailController.text,
                  password: _passwordController.text,
                  cox: context,
                );
                if (user != null) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ToDoScreen(),
                    ),
                  );
                }
              },
              child: const Text(
                'Login',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
