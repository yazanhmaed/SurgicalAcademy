import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/add_app_model.dart';
import '../color_manager.dart';
import '../styles_manager.dart';
import '../values_manager.dart';

class AppItemWidget extends StatelessWidget {
  const AppItemWidget({super.key, required this.appModel, required this.index});
  final AddAppModel appModel;
  final int index;

  _launchURL() async {
    // ignore: deprecated_member_use
    if (await canLaunch(appModel.link!)) {
      // ignore: deprecated_member_use
      await launch(appModel.link!);
      print('sucssrs');
    } else {
      print('error');
      throw 'Could not launch ${appModel.link!}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p5),
      child: GestureDetector(
        onTap: () => _launchURL(),
        child: Container(
          padding: const EdgeInsets.all(AppPadding.p5),
          margin: const EdgeInsets.symmetric(vertical: Appheight.h5),
          height: Appheight.h60,
          decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: ColorManager.grey2,
              ),
              borderRadius: BorderRadius.circular(AppSize.s8),
              color: ColorManager.grey1.withOpacity(0.8)),
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: Appwidth.w300,
                  child: Text('#${index + 1}  ${appModel.title!}',
                      style: getBoldStyle(
                          color: ColorManager.black, fontSize: AppSize.s15),
                      overflow: TextOverflow.ellipsis),
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
