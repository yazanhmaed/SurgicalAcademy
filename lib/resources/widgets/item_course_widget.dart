import 'package:flutter/material.dart';
import 'package:medical_acadmey_app/models/item_courese_model.dart';
import 'package:medical_acadmey_app/resources/string_manager.dart';
import 'package:url_launcher/url_launcher.dart';

import '../color_manager.dart';
import '../styles_manager.dart';
import '../values_manager.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget(
      {super.key, required this.itemCourseModel, required this.index});
  final ItemCourseModel itemCourseModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    Future<void> lanch(String url) async {
      // ignore: deprecated_member_use
      if (await canLaunch(url)) {
        // ignore: deprecated_member_use
        await launch(url, forceWebView: false, forceSafariVC: false);
      } else {
        print(AppString.error);
      }
    }

    return Padding(
      padding: const EdgeInsets.all(AppPadding.p5),
      child: GestureDetector(
        onTap: () => lanch(itemCourseModel.link!),
        child: Container(
          padding: const EdgeInsets.all(AppPadding.p5),
          margin: const EdgeInsets.symmetric(vertical: Appheight.h5),
          height: Appheight.h60,
          decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: ColorManager.grey2,
              ),
              gradient: SweepGradient(colors: [
                Color(0xff1450A3),
                Color(0xffdbe9f6),
              ], center: Alignment.topLeft, startAngle: 0.2),
              borderRadius: BorderRadius.circular(AppSize.s8),
              color: Color(0xff1450A3)),
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: Appwidth.w300,
                  child: Text('${index + 1} )  ${itemCourseModel.description!}',
                      style: getBoldStyle(
                          color: ColorManager.white, fontSize: AppSize.s15),
                      overflow: TextOverflow.ellipsis),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
