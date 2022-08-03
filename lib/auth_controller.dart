import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logging_auth/login_page.dart';
import 'package:logging_auth/welcome_page.dart';

class AuthController extends GetxController{
  //  AuthController.instance....
  static AuthController instance = Get.find();
  //  Email, pasword, name
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady(){
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    //  User notification
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user){
    if(user==null){
      print("login page");
      Get.offAll(()=>LoginPage());
    }else{
      Get.offAll(()=>WelcomePage(email: user.email!));
    } 
  }

  Future<void> register(String email, password) async {
    try{
     await auth.createUserWithEmailAndPassword(email: email, password: password);
  }catch(e){
    Get.snackbar("About User", "User Message",
    backgroundColor: Colors.blueGrey,
    snackPosition: SnackPosition.BOTTOM,
    titleText: Text("Account creation failed",
    style: TextStyle(color: Colors.white),
    ),
    messageText: Text(
      e.toString(),
      style: TextStyle(color: Colors.white),
    )
    );
  }
  }
  Future<void> login(String email, password) async {
    try{
     await auth.signInWithEmailAndPassword(email: email, password: password);
  }catch(e){
    Get.snackbar("About Login", "Login Message",
    backgroundColor: Colors.blueGrey,
    snackPosition: SnackPosition.BOTTOM,
    titleText: Text("Login failed",
    style: TextStyle(color: Colors.white),
    ),
    messageText: Text(
      e.toString(),
      style: TextStyle(color: Colors.white),
    )
    );
  }
  }
  Future<void> logout() async {
   await auth.signOut();
  }
}