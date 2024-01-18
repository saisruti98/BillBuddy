import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  void _submit() {
    //final isValid = _formKey.currentState!.validate();
    // if (isValid) {
    //   print(email.text);
    //   Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //           builder: (context) =>
    //               Home(username: 'Sruti', email: email.text)));
    // }
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Home(username: 'Sruti', email: email.text)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        body: SafeArea(
          child: Padding(
              padding: EdgeInsets.fromLTRB(40, 20, 40, 40),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 100.0,
                        backgroundImage: AssetImage('assets/Logo.jpg'),
                      ),
                      SizedBox(height: 30.0),
                      Text(
                        'Bill Buddy',
                        style: TextStyle(
                            fontSize: 40.0,
                            color: Colors.white,
                            letterSpacing: 1.0,
                            fontFamily: 'Shrikhand'),
                      ),
                      Text(
                        'Smart Spending, Simple Tracking',
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 20.0,
                            color: Colors.white),
                      ),
                      SizedBox(height: 50.0),
                      TextFormField(
                        controller: email,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                            return 'Enter a valid email!';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 0.0),
                          border: UnderlineInputBorder(),
                          labelText: 'Email ID',
                          labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontStyle: FontStyle.italic),
                        ),
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                      SizedBox(height: 30.0),
                      TextFormField(
                        controller: password,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$")
                                  .hasMatch(value)) {
                            return 'Enter a valid password!';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 0.0),
                          border: UnderlineInputBorder(),
                          labelText: 'Password',
                          labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontStyle: FontStyle.italic),
                        ),
                        obscureText: true,
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                      SizedBox(height: 50.0),
                      ElevatedButton.icon(
                        onPressed: _submit,
                        icon: Icon(
                          Icons.login,
                          color: Colors.black,
                          size: 30.0,
                        ),
                        label: Text(
                          'Login',
                          style: TextStyle(color: Colors.black, fontSize: 18.0),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                        child: Text(
                          "Don't have an account? Sign Up",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white,
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                              fontSize: 18.0),
                        ),
                      )
                    ],
                  ),
                ),
              )),
        ));
  }
}
