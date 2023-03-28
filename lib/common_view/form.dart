import 'package:flutter/material.dart';
import 'package:flutter_practice/validator/email_validator.dart';

import '../validator/password_validator.dart';

class LoginSubmission {
  LoginSubmission({required this.email, required this.password});

  final String email;
  final String password;
}

class LoginFormView extends StatefulWidget {
  const LoginFormView({super.key, required this.onSubmitted});

  final ValueChanged<LoginSubmission> onSubmitted;

  @override
  State<StatefulWidget> createState() => _LoginForm();
}

class _LoginForm extends State<LoginFormView> {
  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: [
              TextFormField(
                enabled: true,
                obscureText: false,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                  labelText: 'メールアドレスを入力してください',
                ),
                validator: (String? value) {
                  return EmailValidator.validate(value)
                      ? null
                      : "メールアドレスの書式にあっていません";
                },
                onSaved: (String? value) {
                  if (value == null) {
                    return;
                  }
                  this._email = value;
                },
              ),
              TextFormField(
                enabled: true,
                obscureText: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                  labelText: 'パスワードを入力してください',
                ),
                validator: (String? value) {
                  return PasswordValidator.validate(value)
                      ? null
                      : "パスワードの書式にあっていません";
                },
                onSaved: (String? value) {
                  if (value == null) {
                    return;
                  }
                  this._password = value;
                },
              ),
              ElevatedButton(
                onPressed: _submission,
                child: const Text('保存'),
              )
            ],
          ),
        ));
  }

  void _submission() {
    if (this._formKey.currentState?.validate() == true) {
      this._formKey.currentState?.save();
      this._formKey.currentState?.reset();
      widget.onSubmitted(
          LoginSubmission(email: this._email, password: this._password));
    }
  }
}
