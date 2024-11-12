import 'package:flutter/material.dart';
import '../controllers/login_controller.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final controller = LoginController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: controller.emailController,
            decoration: InputDecoration(labelText: 'Email'),
            validator: (value) => value!.isEmpty ? 'Enter an email' : null,
          ),
          TextFormField(
            controller: controller.passwordController,
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
            validator: (value) => value!.isEmpty ? 'Enter password' : null,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                controller.login();
              }
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
