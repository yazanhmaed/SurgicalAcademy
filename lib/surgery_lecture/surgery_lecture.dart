import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:medical_acadmey_app/resources/color_manager.dart';
import 'package:medical_acadmey_app/resources/string_manager.dart';
import 'package:medical_acadmey_app/resources/values_manager.dart';
import 'package:medical_acadmey_app/resources/widgets/fallback.dart';
import 'package:medical_acadmey_app/resources/widgets/pdf_item_widget.dart';

import '../resources/styles_manager.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class SurgeryLecture extends StatelessWidget {
  const SurgeryLecture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SurgeryLectureCubit()..getSurgeryLecture(),
      child: BlocConsumer<SurgeryLectureCubit, SurgeryLectureStates>(
          listener: (context, state) {},
          builder: (context, state) {
            SurgeryLectureCubit cubit = SurgeryLectureCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  AppString.surgeryLecture,
                ),
              ),
              body: ConditionalBuilder(
                condition: cubit.surgeryLecture.isNotEmpty,
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
                          AppString.surgeryLecture,
                          style: getBoldStyle(
                              color: ColorManager.primary,
                              fontSize: AppSize.s15),
                          textAlign: TextAlign.start,
                        ),
                      ),const Divider(
                      thickness: 4,
                    ),
                      // Widget view List Item Course
                      Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: cubit.surgeryLecture.length,
                          itemBuilder: (context, index) {
                            return PdfItemWidget(
                                pdfModel: cubit.surgeryLecture[index],
                                index: index);
                          },
                        ),
                      )
                    ],
                  ),
                ),
                fallback: (context) =>Fallback(),
              ),
            );
          }),
    );
  }
}
