import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_acadmey_app/Pdf_screen/cubit/states.dart';

import '../resources/color_manager.dart';
import '../resources/string_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';
import '../resources/widgets/pdf_widget.dart';
import 'cubit/cubit.dart';

class PdfFileScreen extends StatelessWidget {
  const PdfFileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PdfCubit()..getPdf(),
      child: BlocConsumer<PdfCubit, PdfStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = PdfCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  AppString.pdf,
                ),
              ),
              body: ConditionalBuilder(
                condition: cubit.pdf.isNotEmpty,
                fallback: (context) => const Center(child: CircularProgressIndicator(),),
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
                     
                      child: Text(
                        AppString.pdf,
                        style: getBoldStyle(
                            color: ColorManager.primary, fontSize: AppSize.s15),
                        textAlign: TextAlign.start,
                      ),
                    ),const Divider(
                      thickness: 4,
                    ),
                    // Widget view List Course
                    Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: cubit.pdf.length,
                        itemBuilder: (context, index) {
                          return PdfWidget(
                              pdfFileModel: cubit.pdf[index], index: index);
                        },
                      ),
                    )
                  ],
                ),
              ),
              ),
            );
          }),
    );
  }
}