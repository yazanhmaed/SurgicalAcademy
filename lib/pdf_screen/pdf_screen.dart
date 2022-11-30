import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_acadmey_app/Pdf_screen/cubit/states.dart';

import 'package:medical_acadmey_app/resources/color_manager.dart';
import 'package:medical_acadmey_app/resources/string_manager.dart';
import 'package:medical_acadmey_app/resources/values_manager.dart';
import 'package:medical_acadmey_app/resources/widgets/pdf_item_widget.dart';

import '../resources/styles_manager.dart';
import 'cubit/cubit.dart';

class PdfCourse extends StatelessWidget {
  const PdfCourse({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PdfCubit()..getPdfItem(id: id),
      child: BlocConsumer<PdfCubit, PdfStates>(
          listener: (context, state) {},
          builder: (context, state) {
            PdfCubit cubit = PdfCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  AppString.barTitle,
                ),
              ),
              body: ConditionalBuilder(
                condition: cubit.pdfItem.isNotEmpty,
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
                          itemCount: cubit.pdfItem.length,
                          itemBuilder: (context, index) {
                            return PdfItemWidget(
                                pdfModel: cubit.pdfItem[index], index: index);
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
