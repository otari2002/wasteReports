import 'package:waste_go/services/auth/LoginOrRegister.dart';
import 'package:waste_go/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const LoginOrRegister();
            } else {
              return const HomeScreen();
            }
        },
      ),
    );
  }
}
