import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/utils.dart';
import 'package:quran/screens/QuestionsScreen.dart';
import 'package:quran/utilities/firebase_auth.dart';

class anotherLogin extends StatelessWidget {
  const anotherLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  color: Theme.of(context).primaryColor.withOpacity(0.3),
                  height: 1,
                ),
              ),
              Text('أو سجل الدخول عبر'),
              Expanded(
                child: Container(
                  color: Theme.of(context).primaryColor.withOpacity(0.3),
                  height: 1,
                ),
              )
            ],
          ),
        ),
        GetBuilder<firebase_auth>(
          builder: (v) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => v.signInWithGoogle(),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Color(0xffdb4437),
                      borderRadius: BorderRadius.circular(3)),
                  child: Center(
                    child: Text(
                      'G',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () => v.signInWithFacebook(),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Color(0xff4064ac),
                      borderRadius: BorderRadius.circular(3)),
                  child: Center(
                    child: Text(
                      'f',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
