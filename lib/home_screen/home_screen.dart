import 'package:flutter/material.dart';
import 'package:medical_acadmey_app/home_screen/components.dart';
import 'package:medical_acadmey_app/login_screen/login_screen.dart';
import 'package:medical_acadmey_app/resources/color_manager.dart';

import 'package:medical_acadmey_app/resources/components.dart';
import 'package:medical_acadmey_app/resources/string_manager.dart';
import 'package:medical_acadmey_app/resources/styles_manager.dart';
import 'package:medical_acadmey_app/resources/values_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../resources/cache_helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void logout() async {
      CacheHelper.removeData(key: AppString.tokenKey);
      CacheHelper.removeData(key: AppString.passKey);
      CacheHelper.removeData(key: AppString.emailKey);
      CacheHelper.removeData(key: 'fav');
      var sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.remove('l');
      navigateAndFinish(context, LoginScreen());
    }

    return Scaffold(
        backgroundColor: Color(0xffdbe9f6),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Color(0xffdbe9f6),
              floating: true,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  AppString.barTitle,
                  style: TextStyle(
                      color: Color(0xff1450A3),
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () => logout(),
                    icon: Icon(
                      Icons.login_outlined,
                      color: Color(0xff1450A3),
                      size: 30,
                    )),
                const SizedBox(
                  width: 10,
                )
              ],
            ),
            SliverGrid.builder(
              itemCount: screens.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => navigateTo(context, screens[index]),
                  //Container Card Style
                  child: Container(
                    padding: const EdgeInsets.all(AppPadding.p8),
                    margin: const EdgeInsets.all(AppMargin.m10),
                    decoration: BoxDecoration(
                        gradient: SweepGradient(colors: [
                          Color(0xff1450A3),
                          Color(0xffdbe9f6),
                        ], center: Alignment.topLeft, startAngle: 0.4),
                        borderRadius: BorderRadius.only(
                            topRight: index % 2 == 0
                                ? Radius.circular(40)
                                : Radius.circular(0),
                            bottomLeft: index % 2 == 0
                                ? Radius.circular(40)
                                : Radius.circular(0),
                            topLeft: index % 2 == 1
                                ? Radius.circular(40)
                                : Radius.circular(0),
                            bottomRight: index % 2 == 1
                                ? Radius.circular(40)
                                : Radius.circular(0)),
                        color: Color(0xff1450A3)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SizedBox(
                          height: Appheight.h15,
                        ),
                        //Icon Card

                        ImageIcon(
                          AssetImage(image[index]),
                          color: Colors.white,
                          size: 80,
                        ),
                        const SizedBox(
                          height: Appheight.h15,
                        ),
                        //Name Card
                        Text(
                          name[index],
                          overflow: TextOverflow.visible,
                          textAlign: TextAlign.center,
                          softWrap: true,
                          style: getBoldStyle(
                                  color: ColorManager.white.withOpacity(0.8))
                              .copyWith(fontSize: AppSize.s18),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ));
  }
}
