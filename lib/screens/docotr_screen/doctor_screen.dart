import 'package:final_graduation_project/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../../auth/auth_provider.dart';
import '../model_screen.dart';

class DoctorHome extends StatefulWidget {
  const DoctorHome({Key? key}) : super(key: key);

  @override
  State<DoctorHome> createState() => _DoctorHomeState();
}

class _DoctorHomeState extends State<DoctorHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Welcome Doctor"),
          leading: IconButton(onPressed: () {
            Get.to(HomeScreen());
          },
            icon: Icon(Icons.arrow_back_ios),
          ),
          actions: [
            IconButton(onPressed: () => Provider.of<AuthProvider>(context,listen: false).SignOut(), icon: Icon(Icons.logout))
          ],
        ),
        body: ListView.builder(
          itemBuilder:(context, index) {
            var prof = Provider.of<AuthProvider>(context);
            prof.patientList.isEmpty? const Center(child: Text("No Pateints found",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),)):
            ListTile(
              title: Text(prof.patientList[index].name),
              // Add any additional properties or widgets for each item
              onTap: () {
                // Handle item tap, navigate to another screen
                Get.to(Model());
              },
              leading: CircleAvatar(
                backgroundImage: AssetImage(""),
                radius: 25,
              ),
              subtitle:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    prof.patientList[index].name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Increase the font size for the name
                  ),
                  SizedBox(height: 5),
                  Text(
                    prof.patientList[index].email,
                    style: TextStyle(fontSize: 14), // Adjust the font size for the phone number
                  ),

                ],
              ),

            );;
          }, )

    );

  }
}