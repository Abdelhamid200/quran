import 'package:flutter/material.dart';
import 'package:quran/widgets/TextField.dart';

import 'SignButtonWidget.dart';
import 'anotherLogin.dart';

class login extends StatelessWidget {
  login({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        TextFieldWidget(
            UniqueKey(), emailController, 'البريد الإكتروني', false),
        TextFieldWidget(UniqueKey(), passwordController, "كلمة المرور", true),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 15),
          child: Text('نسيت كلمة المرور؟'),
        ),
        SignButton(UniqueKey(),emailController,passwordController),
        anotherLogin()
      ],
    );
  }
}
