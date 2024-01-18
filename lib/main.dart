import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/signup.dart';
import 'pages/login.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/': (context) => const Login(),
      '/signup': (context) => const SignUp(),
      '/home': (context) => const Home(username: '', email: ''),
    },
  ));
}
