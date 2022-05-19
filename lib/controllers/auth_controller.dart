import 'package:cloneapp/views/screens/homescreen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloneapp/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloneapp/models//user.dart' as model;

import '../views/screens/auth/login_screen.dart';

class AuthController extends GetxController {
  static AuthController instance =
      Get.find(); // this will help in finding the auth controller
//global variable
  //observable
  late Rx<User?> _user; //firebaseauth user
  late Rx<File?> _pickedImage; // private
  File? get profilePhoto =>
      _pickedImage.value; // getter will get the value value from _picked image
  // and copy to profilePhoto
  User get user => _user.value!;


  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => LoginScreen());
    } else {
      Get.offAll(() => HomeScreen());
    }
  }

  void pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      Get.snackbar('Profile Picture', 'Profile picture Uploaded Successfully');
    }
    _pickedImage = Rx<File?>(File(pickedImage!.path));
  }

//Uploading to  Firebase Storage
  Future<String> _uploadToStorage(File image) async {
    Reference ref = firebaseStorage
        .ref()
        .child('profilePics')
        .child(firebaseAuth.currentUser!.uid);

    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  //registering user

  Future<void> registerUser(
      String username, String email, String password, File? image) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        // save out user to our auth and firebase firestore
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        String downloadUrl = await _uploadToStorage(image);
        model.User user = model.User(
            name: username,
            email: email,
            uid: cred.user!.uid,
            profilePhoto: downloadUrl);
        await firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
      } else {
        Get.snackbar(
          'Error Creating Account',
          'Please Enter all the field',
        );
      }
    } catch (e) {
      //e.tostring  = A string representation of this object.
      Get.snackbar(
        'Error Creating Account',
        e.toString(),
      );
    }
  }

  void LoginUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        print('log success');
      } else {
        Get.snackbar(
          'Error logging in',
          'Please Enter all the field',
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error Logging ',
        e.toString(),
      );
    }
  }

  void signOut() async{
   await firebaseAuth.signOut();

  }
}
