import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_acadmey_app/resources/bloc.dart';
import 'package:medical_acadmey_app/resources/theme_manager.dart';

import 'course_screen/cubit/cubit.dart';
import 'home_screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  // ignore: deprecated_member_use
  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CourseCubit()..getCourse(),
        ),
      ],
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: getApplicationTheme(),
        home: const HomeScreen(),
      ),
    );
  }
}