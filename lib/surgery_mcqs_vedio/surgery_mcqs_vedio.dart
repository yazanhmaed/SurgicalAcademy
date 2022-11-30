import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:medical_acadmey_app/resources/color_manager.dart';
import 'package:medical_acadmey_app/resources/string_manager.dart';
import 'package:medical_acadmey_app/resources/values_manager.dart';
import 'package:medical_acadmey_app/resources/widgets/item_course_widget.dart';

import '../resources/styles_manager.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class SurgeryMcqsVedio extends StatelessWidget {
  const SurgeryMcqsVedio({super.key, });



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SurgeryMcqsVedioCubit()..getSurgeryMcqsVedio(),
      child: BlocConsumer<SurgeryMcqsVedioCubit, SurgeryMcqsVedioStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = SurgeryMcqsVedioCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  AppString.barTitle,
                ),
              ),
              body: ConditionalBuilder(
                condition: cubit.surgeryMcqsVedio.isNotEmpty,
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
                        color: ColorManager.secondary,
                        child: Text(
                          AppString.courses,
                          style: getBoldStyle(
                              color: ColorManager.primary,
                              fontSize: AppSize.s15),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      // Widget view List Item Course
                      Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: cubit.surgeryMcqsVedio.length,
                          itemBuilder: (context, index) {
                            return ItemWidget(
                                itemCourseModel: cubit.surgeryMcqsVedio[index],
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