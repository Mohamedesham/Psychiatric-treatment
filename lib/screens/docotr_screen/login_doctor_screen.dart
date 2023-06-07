import 'package:final_graduation_project/auth/auth_provider.dart';
import 'package:final_graduation_project/screens/docotr_screen/signup_doctor_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class LoginPageDoctor extends StatelessWidget {
  final _fromkey = GlobalKey<FormState>();

  var _email = TextEditingController();
  var _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),

          child: Form(
            key: _fromkey,
            child: Center(

              child: Column(

                children: [
                  SizedBox(height: 100),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(left: 30),
                    child: Row(
                      children: [
                        Text("Hello,",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 50,
                                color: Color.fromRGBO(0, 82, 152,1))),
                      ],
                    ),


                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text("Welcome Back Again",
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),

                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      const Text(
                        "Email",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(1, 34, 79, 1)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty || !value.contains("@")) {
                          return "please enter your email";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Type your email',
                        label: Text('Email'),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Password",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(1, 34, 79, 1)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      controller: _password,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value!.isEmpty || value.length < 3) {
                          return "please enter your password";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Tupe your Password",
                        label: Text("Password"),
                      )),
                  SizedBox(
                    height: 120,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_fromkey.currentState!.validate()) {
                          Provider.of<AuthProvider>(context, listen: false)
                              .LoginDoctor(_email.text, _password.text);
                        } else {
                          Get.snackbar("Login error", toString(),
                              snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.orange);

                        }
                      },
                      child: Text("Login"),
                      style: ElevatedButton.styleFrom(
                          fixedSize:
                          Size(MediaQuery.of(context).size.width, 50),
                          backgroundColor: Color.fromRGBO(0, 82, 152, 1))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "If You Don't Have Account Plesse ,",
                        style: TextStyle(fontSize: 15),
                      ),
                      TextButton(
                          onPressed: () {
                            Get.to(RegisterDoctorScreen());
                          },
                          child: Text(
                            "Signup",
                            style: TextStyle(fontSize: 15),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
