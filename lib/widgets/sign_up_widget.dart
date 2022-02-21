import 'package:flutter/material.dart';

import 'SignButtonWidget.dart';
import 'TextField.dart';
import 'anotherLogin.dart';

class  sign_up  extends StatelessWidget {
  sign_up ({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        TextFieldWidget(UniqueKey(),emailController,'البريد الإكتروني',false),
        TextFieldWidget(UniqueKey(),passwordController,"كلمة المرور",true),
        TextFieldWidget(UniqueKey(),passwordConfirmController,"تأكيد كلمة المرور",true),
        SignButton(UniqueKey(),emailController,passwordController),
        anotherLogin()
      ],
    );
  }
}
