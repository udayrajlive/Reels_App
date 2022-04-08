import 'dart:html';

import 'package:flutter/material.dart';
class ProfileScreen extends StatelessWidget {
  final String uid;
  const ProfileScreen({Key? key,required this.uid,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Text(
        'profileScreen'
      )
    );
  }
}

