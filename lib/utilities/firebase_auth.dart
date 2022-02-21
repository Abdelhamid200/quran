import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quran/screens/LoginScreen.dart';
import 'package:quran/screens/QuestionsScreen.dart';
import 'package:quran/screens/SplashScreen.dart';
import 'package:quran/widgets/login_widget.dart';
import 'package:quran/widgets/sign_up_widget.dart';

class firebase_auth extends GetxController {
  bool loginBool = true;
  bool obscure = true;

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  Future splash() async {
    Timer(Duration(seconds: 3), () {
      if (FirebaseAuth.instance.currentUser != null) {
        Get.to(QuestionsScreen());
      } else {
        Get.to(LoginScreen());
      }
    });
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    Get.to(QuestionsScreen());

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    Get.to(QuestionsScreen());
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Widget SwitchLoginWidget() {
    if (loginBool) {
      return login();
    } else {
      return sign_up();
    }
  }

  void SwitchLogin() {
    loginBool = !loginBool;
    update();
  }

  void SwitchObscure() {
    obscure = !obscure;
    update();
  }

  Future sign(
      TextEditingController email, TextEditingController password) async {
    if(email.text.isNotEmpty &&password.text.length >8){
      if (loginBool) {
        try {
          await FirebaseAuth.instance
              .signInWithEmailAndPassword(
              email: email.text, password: password.text)
              .whenComplete(() {
            Get.to(QuestionsScreen());
          });
          return null;
        } on FirebaseAuthException catch (e) {
          return e.message;
        }
      } else {
        try {
          await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
            email: email.text,
            password: password.text,
          )
              .whenComplete(() {
            Get.to(QuestionsScreen());
          });
          return null;
        } on FirebaseAuthException catch (e) {
          return e.message;
        }
      }
    }
  }

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
    print('signout');
    Get.to(SplashScreen());
  }

  @override
  void onInit() {
    _initializeFirebase();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
