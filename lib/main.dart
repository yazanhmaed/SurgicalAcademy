import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_acadmey_app/login_screen/login_screen.dart';
import 'package:medical_acadmey_app/resources/bloc.dart';
import 'package:medical_acadmey_app/resources/cache_helper.dart';
import 'package:medical_acadmey_app/resources/components.dart';
import 'package:medical_acadmey_app/resources/theme_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'course_screen/cubit/cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await CacheHelper.init();
  var sharedPreferences = await SharedPreferences.getInstance();
  favoriteList=sharedPreferences.getStringList('l');

  if (favoriteList != null) {
    email = favoriteList![0];
    passLo = favoriteList![1];
  }

 
  // ignore: deprecated_member_use
  BlocOverrides.runZoned(
    () {
      runApp(MyApp(
        
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key,});


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CourseCubit()..getCourse(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: getApplicationTheme(),
        home: LoginScreen(),
      ),
    );
  }
}
