import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:quran/utilities/firebase_auth.dart';

class SignButton extends StatelessWidget {
  TextEditingController email, password;
   SignButton(Key? key,this.email,this.password) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<firebase_auth>(
      builder: (v) => InkWell(
        onTap: () => v.sign(email,password),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height *0.07,
          margin: EdgeInsets.symmetric(horizontal: 15,vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(3),
          ),
          child: Center(
            child: Text(
              v.loginBool ? 'تسجيل الدخول' : 'إنشاء حساب جديد',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ),
        ),
      ),
    );
  }
}
