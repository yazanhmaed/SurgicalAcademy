import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_acadmey_app/Pdf_screen/cubit/states.dart';
import 'package:medical_acadmey_app/resources/widgets/fallback.dart';

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
              backgroundColor: Color(0xffdbe9f6),
              body: ConditionalBuilder(
                condition: cubit.pdf.isNotEmpty,
                fallback: (context) => Fallback(),
                builder: (context) => CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      floating: true,
                      pinned: false,
                      backgroundColor: Color(0xffdbe9f6),
                      flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true,
                        title: const Text(
                          AppString.pdf,
                          style: TextStyle(
                              color: Color(0xff1450A3),
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Appwidth.w20),
                        height: Appheight.h40,
                        child: Text(
                          AppString.pdf,
                          style: getBoldStyle(
                              color: ColorManager.primary,
                              fontSize: AppSize.s15),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    SliverList.builder(
                      itemCount: cubit.pdf.length,
                      itemBuilder: (context, index) {
                        return PdfWidget(
                            pdfFileModel: cubit.pdf[index], index: index);
                      },
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
