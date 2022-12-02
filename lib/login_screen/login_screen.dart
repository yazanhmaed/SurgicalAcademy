import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_acadmey_app/home_screen/home_screen.dart';
import 'package:medical_acadmey_app/login_screen/cubit/cubit.dart';
import 'package:medical_acadmey_app/login_screen/cubit/states.dart';
import 'package:medical_acadmey_app/resources/color_manager.dart';
import 'package:medical_acadmey_app/resources/components.dart';

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
            print('error');
          }
          if (state is UserSuccessState) {
            if (state.tokenLogin.uid != null) {
              CacheHelper.seveData(
                      key: AppString.tokenKey, value: state.tokenLogin.uid)
                  .then((value) {
                navigateAndFinish(context, const HomeScreen());
              }).catchError((onError) {
                print(onError);
              });
            }
          }
        },
        builder: (context, state) {
          var emailController = TextEditingController();
          var passwordController = TextEditingController();
          var key = GlobalKey<FormState>();
          var cubit = UserCubit.get(context);
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
                              onPressed: () {},
                              child: Text('Register',
                                  style: getBoldStyle(
                                      color: ColorManager.primary,
                                      fontSize: 15))),
                          ElevatedButton(
                              onPressed: () {
                                if (key.currentState!.validate()) {
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
