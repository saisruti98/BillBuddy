import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/signup.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/': (context) => const SignUp(),
      '/home': (context) => const Home(),
    },
  ));
}
