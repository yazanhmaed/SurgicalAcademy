import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medical_acadmey_app/home_screen/home_screen.dart';
import 'package:medical_acadmey_app/login_screen/cubit/cubit.dart';
import 'package:medical_acadmey_app/login_screen/cubit/states.dart';
import 'package:medical_acadmey_app/login_screen/register.dart';
import 'package:medical_acadmey_app/resources/color_manager.dart';
import 'package:medical_acadmey_app/resources/components.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../resources/cache_helper.dart';
import '../resources/string_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/widgets/input_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(),
      child: BlocConsumer<UserCubit, UserStates>(
        listener: (context, state) {
          if (state is UserErrorState) {
            Fluttertoast.showToast(
                msg: "تأكد من الايميل و كلمه المرور",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
          if (state is UserSuccessState) {
            // if (state.emailLogin.uid != null) {
            //   // CacheHelper.seveData(
            //   //     key: AppString.emailKey, value: state.emailLogin.uid);
            //   CacheHelper.seveData(
            //           key: AppString.emailKey, value: state.emailLogin.uid)
            //       .then((value) {
            //     print(value);
            navigateAndFinish(context, const HomeScreen());
            //   }).catchError((onError) {
            //     print(onError);
            //   });
            // }
          }
        },
        builder: (context, state) {
          var emailController = TextEditingController();
          var passwordController = TextEditingController();
          var key = GlobalKey<FormState>();
          var cubit = UserCubit.get(context);

          emailController.text = email ?? '';
          passwordController.text = passLo??'';
          return Scaffold(
            body: Form(
              key: key,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppString.loginImage),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppString.medicalAcademy,
                      style: getBoldStyle(
                          color: ColorManager.primary, fontSize: 35),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    InputText(
                      hintText: 'Enter Your Email',
                      icon: Icons.email,
                      validator: 'Enter Your Email',
                      controller: emailController,
                    ),
                    InputText(
                      obscureText: true,
                      hintText: 'Enter Your Password',
                      icon: Icons.password,
                      validator: 'Enter Your Password',
                      controller: passwordController,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () => navigateTo(context, Register()),
                              child: Text('Register',
                                  style: getBoldStyle(
                                      color: ColorManager.primary,
                                      fontSize: 15))),
                          ElevatedButton(
                              onPressed: () async {
                                if (key.currentState!.validate()) {
                                  var sharedPreferences =
                                      await SharedPreferences.getInstance();
                                  sharedPreferences.setStringList('l', [
                                    emailController.text,
                                    passwordController.text
                                  ]);

                                  CacheHelper.setFav([
                                    emailController.text,
                                    passwordController.text
                                  ]);

                                  cubit.userLogin(
                                      email:
                                          '${emailController.text}@academy.com',
                                      password: passwordController.text);
                                }
                              },
                              child: Text('Login',
                                  style: getBoldStyle(
                                      color: ColorManager.white,
                                      fontSize: 15))),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
