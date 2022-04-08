
import 'package:cloneapp/views/screens/add_videoscreens.dart';
import 'package:cloneapp/views/screens/search_screen.dart';
import 'package:cloneapp/views/screens/video_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'controllers/auth_controller.dart';



//screens
List pages = [
  VideoScreen(),
   SearchScreen(),
  const AddVideoScreen(),
  Text('MessageScreen',
    style: TextStyle(
      fontSize: 40,
      fontFamily: 'WorkSans',
      fontWeight: FontWeight.w400,
    ),),
  Text('ProfileScreen',
    style: TextStyle(
      fontSize: 40,
      fontFamily: 'WorkSans',
      fontWeight: FontWeight.w400,
    ),),

];



//colors
const backgroundColor =Colors.black;
const buttonColor = Color(0xFFFF4169);
const borderColor = Colors.grey;
//Firebase relate dcostants
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore =  FirebaseFirestore.instance;
//controllers
var authController = AuthController.instance;