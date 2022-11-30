import 'package:flutter/material.dart';
import 'package:medical_acadmey_app/home_screen/components.dart';
import 'package:medical_acadmey_app/resources/color_manager.dart';

import 'package:medical_acadmey_app/resources/components.dart';
import 'package:medical_acadmey_app/resources/string_manager.dart';
import 'package:medical_acadmey_app/resources/styles_manager.dart';
import 'package:medical_acadmey_app/resources/values_manager.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppString.barTitle,
        ),
      ),
      body: GridView.builder(
        itemCount: screens.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => navigateTo(context, screens[index]),
            //Container Card Style
            child: Container(
              padding: const EdgeInsets.all(AppPadding.p8),
              margin: const EdgeInsets.all(AppMargin.m8),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: ColorManager.lightGrey, width: Appwidth.w5),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(AppSize.s20, AppSize.s5),
                      blurRadius: AppSize.s20,
                      color: ColorManager.grey1,
                      //  inset: true,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(AppSize.s20),
                  color: ColorManager.secondary),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Icon Card
                  Icon(
                    icon[index],
                    size: AppSize.s80,
                    color: ColorManager.primary,
                  ),
                  const SizedBox(
                    height: Appheight.h15,
                  ),
                  //Name Card
                  Text(
                    name[index],
                    overflow: TextOverflow.visible,
                    softWrap: true,
                    style: getBoldStyle(color: ColorManager.black)
                        .copyWith(fontSize: AppSize.s20),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
