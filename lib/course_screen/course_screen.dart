import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_acadmey_app/course_screen/cubit/cubit.dart';
import 'package:medical_acadmey_app/course_screen/cubit/states.dart';
import 'package:medical_acadmey_app/resources/color_manager.dart';
import 'package:medical_acadmey_app/resources/string_manager.dart';
import 'package:medical_acadmey_app/resources/styles_manager.dart';
import 'package:medical_acadmey_app/resources/values_manager.dart';
import 'package:medical_acadmey_app/resources/widgets/course_widget.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CourseCubit, CourseStates>(
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
              condition: cubit.course.isNotEmpty,
              fallback: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
              builder: (context) => Padding(
                padding: const EdgeInsets.only(top: AppPadding.p10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //label Text
                    Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: Appwidth.w20),
                      height: Appheight.h40,
                      // color: ColorManager.white,
                      child: Text(
                        AppString.courses,
                        style: getBoldStyle(
                            color: ColorManager.primary, fontSize: AppSize.s15),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    const Divider(
                      thickness: 4,
                    ),
                    // Widget view List Course
                    Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: cubit.course.length,
                        itemBuilder: (context, index) {
                          return CourseWidget(
                              courseModel: cubit.course[index], index: index);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
