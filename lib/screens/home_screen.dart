 import 'package:final_graduation_project/screens/about_screen.dart';
import 'package:final_graduation_project/screens/model_screen.dart';
import 'package:final_graduation_project/screens/setteing_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';

import '../auth/auth_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Weclome back  ",
          style: TextStyle(color: Colors.blue),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image(
            image: Image
                .asset('assets/A.png')
                .image,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 2, // Replace with the actual item count
        itemBuilder: (context, index) {
          List<String> names = ['John Doe', 'Jane Smith'];
          List<String> imagePaths = ['assets/doct1.jpg', 'assets/doct2.jpg']; // Replace with your actual image paths or data source
          List<String> phoneNumbers = ['123-456-7890', '987-654-3210']; // Replace with your actual phone numbers or data source

          return ListTile(
            title: Text('Doctor '),
            // Add any additional properties or widgets for each item
            onTap: () {
              // Handle item tap, navigate to another screen
              Get.to(Model());
            },
            leading: CircleAvatar(
              backgroundImage: AssetImage(imagePaths[index]),
              radius: 25,
            ),
            subtitle:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  names[index],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Increase the font size for the name
                ),
                SizedBox(height: 5),
                Text(
                  phoneNumbers[index],
                  style: TextStyle(fontSize: 14), // Adjust the font size for the phone number
                ),

              ],
            ),

          );
        },
      )
      ,
      endDrawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color(0xFFFFFFFF),
          //This will change the drawer background to blue.
          //other styles
        ),
        child: ClipRRect(
          //borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
          borderRadius: BorderRadius.circular(40),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Drawer(
            elevation: 0.0,
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(70),
                    image: DecorationImage(
                      image: AssetImage("assets/A.png"),
                    ),
                    // fit: BoxFit.none,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Divider(
                  color: Colors.white,
                  thickness: 5,
                ),
                SizedBox(
                  height: 45,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 45,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            image: new DecorationImage(
                              image: new AssetImage("assets/icon1.png"),
                              fit: BoxFit.none,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 0.5,
                                blurRadius: 4,
                                offset:
                                Offset(6, 8), // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextButton(
                          onPressed: () {
                            Get.to(Model());
                          },
                          child: Text(
                            "Home",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 65,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            image: new DecorationImage(
                              image: new AssetImage("assets/icon2.png"),
                              fit: BoxFit.none,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 0.5,
                                blurRadius: 4,
                                offset:
                                Offset(6, 8), // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextButton(
                            onPressed: () => Get.to(AboutScreen()),
                            child: Text(
                              "About",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            )),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 45,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            image: new DecorationImage(
                              image: new AssetImage("assets/icon6.png"),
                              fit: BoxFit.none,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 0.5,
                                blurRadius: 4,
                                offset:
                                Offset(6, 8), // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextButton(
                          onPressed: () {
                            Get.to(SetteingScreen());
                          },
                          child: Text(
                            "Settings",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 65,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 45,
                    ),
                    SizedBox(
                      width: 65,
                    ),
                    Column(),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 110,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            image: new DecorationImage(
                              image: new AssetImage("assets/icon7.png"),
                              fit: BoxFit.none,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 0.5,
                                blurRadius: 4,
                                offset:
                                Offset(6, 8), // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        TextButton(
                          onPressed: () {
                            Provider.of<AuthProvider>(context).SignOut();
                          },
                          child: Text("Log Out"),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 80,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
