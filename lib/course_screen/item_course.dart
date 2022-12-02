import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_acadmey_app/course_screen/cubit/cubit.dart';
import 'package:medical_acadmey_app/course_screen/cubit/states.dart';
import 'package:medical_acadmey_app/resources/color_manager.dart';
import 'package:medical_acadmey_app/resources/string_manager.dart';
import 'package:medical_acadmey_app/resources/values_manager.dart';
import 'package:medical_acadmey_app/resources/widgets/item_course_widget.dart';

import '../resources/styles_manager.dart';

class ItemCourse extends StatelessWidget {
  const ItemCourse({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CourseCubit()..getItemCourse(id: id),
      child: BlocConsumer<CourseCubit, CourseStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = CourseCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  AppString.courses,
                ),
              ),
              body: ConditionalBuilder(
                condition: cubit.itemCourse.isNotEmpty,
                builder: (context) => Padding(
                  padding: const EdgeInsets.only(top: AppPadding.p10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //label Text
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Appwidth.w20),
                        height: Appheight.h40,
                        child: Text(
                          AppString.courses,
                          style: getBoldStyle(
                              color: ColorManager.primary,
                              fontSize: AppSize.s15),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      const Divider(
                      thickness: 4,
                    ),
                      // Widget view List Item Course
                      Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: cubit.itemCourse.length,
                          itemBuilder: (context, index) {
                            return ItemWidget(
                                itemCourseModel: cubit.itemCourse[index],
                                index: index);
                          },
                        ),
                      )
                    ],
                  ),
                ),
                fallback: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }),
    );
  }
}
