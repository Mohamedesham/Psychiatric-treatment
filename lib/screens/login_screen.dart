import 'package:final_graduation_project/auth/auth_provider.dart';
import 'package:final_graduation_project/screens/sign_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  final _fromkey = GlobalKey<FormState>();

  var _name = TextEditingController();
  var _password = TextEditingController();
  var _passwordconfrim = TextEditingController();
  var _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
                key: _fromkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 35,
                    ),
                    Text(
                      "Sign Up",
                      style:
                          TextStyle(fontSize: 31, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Email",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(1, 34, 79, 1)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                        controller: _email,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your email";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Type Your email",
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Name",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(1, 34, 79, 1)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                        controller: _name,
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your name";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Type Your name",
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Password",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(1, 34, 79, 1)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                        controller: _password,
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty || value.length < 8) {
                            return "Please enter your password";
                          }
                          return null;
                        },
                        decoration:
                            InputDecoration(hintText: "Type your password")),
                    Text(
                      "Confrim Passord",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(1, 34, 79, 1)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                        controller: _passwordconfrim,
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please confirm your password";
                          }
                          if (value != _password.text) {
                            return "password do not match";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "Type your confrim passwprd")),
                    SizedBox(height: 30),
                    Container(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_fromkey.currentState!.validate()) {
                            Provider.of<AuthProvider>(context, listen: false)
                                .Register(_email.text, _password.text,
                                    _passwordconfrim.text, _name.text);
                          }
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account?"),
                        TextButton(
                            onPressed: () {
                              Get.to(LoginScreen());
                            },
                            child: Text("Login"))
                      ],
                    ),
                  ],
                ))),
      ),
    );
  }
}
