import 'package:camera/camera.dart';
import 'package:final_graduation_project/auth/auth_provider.dart';
import 'package:final_graduation_project/provider/contol_provider.dart';
import 'package:final_graduation_project/provider/photo_provider.dart';
import 'package:final_graduation_project/screens/home_screen.dart';
import 'package:final_graduation_project/screens/video_call_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

List<CameraDescription>? cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final fcmToken = await FirebaseMessaging.instance.getToken();
  print(fcmToken);
  cameras = await availableCameras();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ControlProvider()),
    ChangeNotifierProvider(create: (context) => AuthProvider()),
    ChangeNotifierProvider(create: (context) => PhotoProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: VideoScreen(callID: '',),
    );
  }
}
