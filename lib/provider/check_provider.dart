import 'package:final_graduation_project/provider/contol_provider.dart';
import 'package:final_graduation_project/screens/home_screen.dart';
import 'package:final_graduation_project/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ControlProvider>(
      builder: (context, value, child) {
        return value.id == null ? RegisterScreen() : HomeScreen();
      },
    );
  }
}
