import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/utilities/firebase_auth.dart';
import 'package:quran/widgets/SwitchAuth.dart';
class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      body: Directionality( // add this
      textDirection: TextDirection.rtl,
        child: Center(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    height: MediaQuery.of(context).size.height*0.25,child: Image.asset('assets/logo/logo_png.png')),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Color(0xfffbf9f6),
                    borderRadius: BorderRadius.circular(4)
                ),
                width: MediaQuery.of(context).size.width*0.9,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    SwitchAuth(),
                    GetBuilder<firebase_auth>(
                      builder:(v) => Container(
                        child: v.SwitchLoginWidget(),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


