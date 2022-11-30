import 'package:flutter/material.dart';
import 'package:medical_acadmey_app/pdf_screen/pdf_screen.dart';

import '../../models/pdf_file_model.dart';
import '../color_manager.dart';
import '../components.dart';
import '../styles_manager.dart';
import '../values_manager.dart';

class PdfWidget extends StatelessWidget {
  const PdfWidget({super.key, required this.pdfFileModel, required this.index});
  final PdfFileModel pdfFileModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p8),
      child: GestureDetector(
        onTap: () => navigateTo(context, PdfCourse(id: pdfFileModel.id!)),
        child: Container(
          padding: const EdgeInsets.all(AppPadding.p5),
          margin: const EdgeInsets.symmetric(vertical: Appheight.h5),
          height: Appheight.h60,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: const Offset(AppSize.ss30, AppSize.s80),
                  blurRadius: AppSize.s60,
                  color: ColorManager.secondary,
                  // inset: true,
                ),
                BoxShadow(
                  offset: const Offset(AppSize.s20, AppSize.s20),
                  blurRadius: AppSize.s60,
                  color: ColorManager.grey1,
                  //  inset: true,
                ),
              ],
              borderRadius: BorderRadius.circular(AppSize.s8),
              color: ColorManager.lightGrey),
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '#${index + 1}  ${pdfFileModel.title!}',
                  style: getBoldStyle(
                      color: ColorManager.black, fontSize: AppSize.s18),
                ),
                const Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
