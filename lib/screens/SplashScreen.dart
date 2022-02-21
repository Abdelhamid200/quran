import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:quran/screens/LoginScreen.dart';
import 'package:quran/utilities/firebase_auth.dart';

import 'QuestionsScreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetBuilder<firebase_auth>(
      init: firebase_auth(),
      builder: (v) {
        v.splash();
        return Scaffold(
        body: Container(
          color: Theme.of(context).primaryColor,
          child: Stack(
            children: [
              Center(
                child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: Image.asset('assets/logo/logo_png.png')),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/logo/tamayyuz.svg',
                        semanticsLabel: 'Acme Logo'),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'جميع الحقوق محفوظة لمركز تميز © 2021',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 12),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );}
    );
  }
}
