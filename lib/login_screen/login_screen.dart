import 'package:flutter/material.dart';
import 'package:medical_acadmey_app/home_screen/home_screen.dart';
import 'package:medical_acadmey_app/resources/color_manager.dart';
import 'package:medical_acadmey_app/resources/components.dart';

import '../resources/styles_manager.dart';
import '../resources/widgets/input_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var emailText = TextEditingController();
    var passwordText = TextEditingController();
    var key = GlobalKey<FormState>();
    return Scaffold(
      body: Form(
        key: key,
        child: Container(
           decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/back5.png"),
            fit: BoxFit.cover,
          ),
        ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Medical Academy',
                  style: getBoldStyle(color: ColorManager.primary, fontSize: 35),
                ),
                const SizedBox(
                  height: 50,
                ),
                InputText(
                  hintText: 'Enter Your Email',
                  icon: Icons.email,
                  validator: 'Enter Your Email',
                  controller: emailText,
                ),
                InputText(
                  hintText: 'Enter Your Password',
                  icon: Icons.password,
                  validator: 'Enter Your Password',
                  controller: passwordText,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Text('Register',
                              style: getBoldStyle(
                                  color: ColorManager.primary, fontSize: 15))),
                      ElevatedButton(
                          onPressed: () {
                            navigateAndFinish(context, const HomeScreen());
                          },
                          child: Text('Login',
                              style: getBoldStyle(
                                  color: ColorManager.white, fontSize: 15))),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
