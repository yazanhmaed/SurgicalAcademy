import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:medical_acadmey_app/resources/color_manager.dart';
import 'package:medical_acadmey_app/resources/string_manager.dart';
import 'package:medical_acadmey_app/resources/values_manager.dart';
import 'package:medical_acadmey_app/resources/widgets/pdf_item_widget.dart';

import '../resources/styles_manager.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class QuestionBank extends StatelessWidget {
  const QuestionBank({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuestionBankCubit()..getQuestionBank(),
      child: BlocConsumer<QuestionBankCubit, QuestionBankStates>(
          listener: (context, state) {},
          builder: (context, state) {
            QuestionBankCubit cubit = QuestionBankCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  AppString.questionBank,
                ),
              ),
              body: ConditionalBuilder(
                condition: cubit.questionBank.isNotEmpty,
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
                          AppString.questionBank,
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
                          itemCount: cubit.questionBank.length,
                          itemBuilder: (context, index) {
                            return PdfItemWidget(
                                pdfModel: cubit.questionBank[index],
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
