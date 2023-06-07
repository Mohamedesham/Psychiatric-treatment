import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_graduation_project/model/model.dart';
import 'package:final_graduation_project/model/model_doctor.dart';
import 'package:final_graduation_project/screens/choose_account_screen.dart';
import 'package:final_graduation_project/screens/docotr_screen/doctor_screen.dart';
import 'package:final_graduation_project/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthProvider extends ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseFirestore database = FirebaseFirestore.instance;
  PatientModel user = PatientModel(name: '', email: "", ID: "", image: "");
  DoctorModel doctor = DoctorModel(name: '', email: "", ID: "", image: "");

  void Login(String email, password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.to(HomeScreen());
      Get.offAll(HomeScreen());
    } catch (e) {
      Get.snackbar("Login error", e.toString(),
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.orange);
    }
  }

  void LoginDoctor(String email, password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.to(DoctorHome());
      Get.offAll(DoctorHome());
    } catch (e) {
      Get.snackbar("Login error", e.toString(),
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.orange);
    }
  }

  void SignOut() async {
    await _auth.signOut();
    Get.offAll(ChosseAccount());
  }

  void RegisterDoctor(String email, password,confrimpassword, name) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        Doctoruser(user, name,email);
      });
      Get.offAll(DoctorHome());
    } catch (e) {
      Get.snackbar("Signout error", e.toString(),
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.orange);
    }
  }


  void Register(String email, password,confrimpassword, name) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        Patientuser(user, name,email);
      });
      Get.offAll(HomeScreen());
    } catch (e) {
      Get.snackbar("Signout error", e.toString(),
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.orange);
    }
  }


  Patientuser(UserCredential user, String name,String email) async {
    PatientModel usermodel = PatientModel(
        name: name == "" ? user.user!.displayName! : name,
        email:email== ""?user.user!.displayName!:email,
        ID: user.user!.uid,
        image: "");
    await _firestore
        .collection("users")
        .doc(user.user!.uid)
        .set(usermodel.toJson());
  }

  Doctoruser(UserCredential user, String name,String email) async {
    DoctorModel doctormodel = DoctorModel(
        name: name == "" ? user.user!.displayName! : name,
        email:email== ""?user.user!.displayName!:email,
        ID: user.user!.uid,
        image: "");
    await _firestore
        .collection("users")
        .doc(user.user!.uid)
        .set(doctormodel.toJson());
  }


  getdocotr() async {
    await database
        .collection('doctors')
        .doc(_auth.currentUser!.uid)
        .get()
        .then((value) {
      doctor = DoctorModel.fromJson(value.data()!);
      notifyListeners();
    });
  }

  getpatient() async {
    await database
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .get()
        .then((value) {
      user = PatientModel.fromJson(value.data()!);
      notifyListeners();
    });
  }

}
