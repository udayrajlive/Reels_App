import 'package:cloneapp/constants.dart';
import 'package:cloneapp/views/screens/auth/login_screen.dart';
// import 'package:cloneapp/views/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
//import 'dart:html';
import 'package:cloneapp/views/screens/auth/signup_scree.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:firebase_core/firebase_core.dart';

import 'controllers/auth_controller.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';


void main()
async{
  WidgetsFlutterBinding.ensureInitialized();//flutter know widgets initialized
  await Firebase.initializeApp().then((value)
      {
        Get.put(AuthController());
      });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      title: 'InShOt Clone ',
      //      home : LoginScreen(),
      home: Signupscreen(),

    );
  }
}

