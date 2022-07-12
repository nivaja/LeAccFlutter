import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../common/views/action_button.dart';
import '../../common/views/input_field_widget.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(45.0),
        child: Expanded(
          child: ListView(
            shrinkWrap: true,
            children: [
              Text('Welcome',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.blue[600],
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 30,
              ),
              FrappeTextField('Server Address', Icon(Icons.adf_scanner)),
              Padding(padding: EdgeInsets.all(12)),
              FrappeTextField('Username', Icon(Icons.person)),
              Padding(padding: EdgeInsets.all(12)),
              FrappeTextField('Password', Icon(Icons.lock)),
              SizedBox(
                height: 30,
              ),
              FrappeNavigationButton('Login'),
            ],
          ),
        ),
      ),
    );
  }
}
