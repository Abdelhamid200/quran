import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:quran/utilities/firebase_auth.dart';

class TextFieldWidget extends StatefulWidget {
  var text, controller, isPassword;

  TextFieldWidget(Key? key, this.controller, this.text, this.isPassword)
      : super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: widget.isPassword
          ? GetBuilder<firebase_auth>(
              builder: (v) => TextFormField(
                key: UniqueKey(),
                controller: widget.controller,
                obscureText: v.obscure,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      v.SwitchObscure();
                    },
                    child: Icon(
                      v.obscure ? Icons.visibility : Icons.visibility_off,
                      color: Theme.of(context).primaryColor.withOpacity(0.5),
                    ),
                  ),
                  filled: true,
                  hintText: widget.text,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                      width: 0.3,
                    ),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  border: const OutlineInputBorder(),
                ),
              ),
            )
          : TextFormField(
              key: UniqueKey(),
              controller: widget.controller,
              decoration: InputDecoration(
                filled: true,
                hintText: widget.text,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.secondary,
                    width: 0.3,
                  ),
                  borderRadius: BorderRadius.circular(3),
                ),
                border: const OutlineInputBorder(),
              ),
            ),
    );
  }
}
