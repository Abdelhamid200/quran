import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/utilities/firebase_auth.dart';

class SwitchAuth extends StatelessWidget {
   SwitchAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<firebase_auth>(
      init: firebase_auth(),
      builder: (v) => Container(
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  v.SwitchLogin();
                },
                child: Container(
                  decoration: !v.loginBool
                      ? BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Theme.of(context).primaryColor,
                        )
                      : BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.1),
                        ),
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: Center(child: Text('إنشاء حساب',style: TextStyle(
                      color:!v.loginBool ?Theme.of(context).colorScheme.secondary: Theme.of(context).primaryColor,fontSize: 16
                  ),)),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  v.SwitchLogin();
                },
                child: Container(
                  decoration: v.loginBool
                      ? BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Theme.of(context).primaryColor,
                        )
                      : BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.1),
                        ),
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: Center(child: Text('تسجيل الدخول',style: TextStyle(
                      color:v.loginBool ?Theme.of(context).colorScheme.secondary: Theme.of(context).primaryColor,fontSize: 16
                  ),)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
