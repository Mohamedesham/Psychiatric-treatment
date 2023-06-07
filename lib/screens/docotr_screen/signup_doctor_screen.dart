import 'package:final_graduation_project/auth/auth_provider.dart';
import 'package:final_graduation_project/screens/docotr_screen/login_doctor_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class RegisterDoctorScreen extends StatelessWidget {
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
                      "Doctor Name",
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
                                .RegisterDoctor(_email.text, _password.text,
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
                              Get.to(LoginPageDoctor());
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

// import 'package:final_graduation_project/screens/docotr_screen/doctor_screen.dart';
// import 'package:final_graduation_project/screens/docotr_screen/signup_doctor_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/get_core.dart';
//
// class LoginPageDoctor extends StatefulWidget {
//   const LoginPageDoctor({Key? key}) : super(key: key);
//
//   @override
//   State<LoginPageDoctor> createState() => _LoginPageDoctorState();
// }
//
// class _LoginPageDoctorState extends State<LoginPageDoctor> {
//   final _formKey = GlobalKey<FormState>();
//   var emailController = TextEditingController();
//   var passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           child: Column(children: [
//             const SizedBox(
//               height: 100,
//             ),
//             Container(
//               alignment: Alignment.topLeft,
//               padding: const EdgeInsets.only(left: 30),
//               child: const Column(
//                 children: [
//                   Row(
//                     children: [
//                       Text("Hello,",
//                           textAlign: TextAlign.left,
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 50,
//                               color: Color.fromRGBO(0, 82, 152, 1))),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Row(
//                     children: [
//                       Text(
//                         "Welcome Back Again",
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.w600),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Row(
//                     children: [
//                       Text(
//                         "Plesse fill in form  to login",
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.normal),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 80,
//             ),
//             Form(
//                 key: _formKey,
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 30, right: 30),
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           const Text(
//                             "Email",
//                             style: TextStyle(
//                                 fontSize: 30,
//                                 fontWeight: FontWeight.w600,
//                                 color: Color.fromRGBO(1, 34, 79, 1)),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       TextField(
//                         controller: emailController,
//                         decoration:
//                             InputDecoration(hintText: "Type Your email"),
//                       ),
//                       SizedBox(
//                         height: 30,
//                       ),
//                       Row(
//                         children: [
//                           const Text(
//                             "Password",
//                             style: TextStyle(
//                                 fontSize: 30,
//                                 fontWeight: FontWeight.w600,
//                                 color: Color.fromRGBO(1, 34, 79, 1)),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       TextField(
//                           controller: passwordController,
//                           obscureText: true,
//                           decoration:
//                               InputDecoration(hintText: "Type Your Password")),
//                       SizedBox(
//                         height: 120,
//                       ),
//                       ElevatedButton(
//                           onPressed: () {
//                             if (_formKey.currentState!.validate()) {
//                               // Navigate the user to the Home page
//                               Get.to(DoctorHome());
//                             } else {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                     content: Text('Please fill input')),
//                               );
//                             }
//                           },
//                           child: Text("Login"),
//                           style: ElevatedButton.styleFrom(
//                               fixedSize:
//                                   Size(MediaQuery.of(context).size.width, 50),
//                               backgroundColor: Color.fromRGBO(0, 82, 152, 1))),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Text(
//                             "If You Don't Have Account Plesse ,",
//                             style: TextStyle(fontSize: 15),
//                           ),
//                           TextButton(
//                               onPressed: () {
//                                 Get.to(signupPageDoctor());
//                               },
//                               child: Text(
//                                 "Signup",
//                                 style: TextStyle(fontSize: 15),
//                               ))
//                         ],
//                       )
//                     ],
//                   ),
//                 )),
//           ]),
//         ),
//       ),
//     );
//   }
// }
