import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_acadmey_app/resources/color_manager.dart';
import 'package:medical_acadmey_app/resources/styles_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class Register extends StatelessWidget {
  const Register({super.key});
  __launchWhatsapp() async {
    var whatsapp = "+962798260241";
    var whatsappAndroid =
        Uri.parse("whatsapp://send?phone=$whatsapp&text=Surgical Academy");
    if (await canLaunchUrl(whatsappAndroid)) {
      await launchUrl(whatsappAndroid);
    } else {
      Fluttertoast.showToast(
          msg: "Error",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width * 4;
    var height = MediaQuery.sizeOf(context).height / 1.5;
    return Scaffold(
        backgroundColor: Color(0xffdbe9f6),
        appBar: AppBar(
          backgroundColor: Color(0xffdbe9f6),
          leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(Icons.arrow_back_ios)),
        ),
        body: Center(
          child: Container(
            width: width,
            height: height,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: ColorManager.white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.whatsapp,
                  size: 90,
                  color: Colors.green,
                ),
                SizedBox(height: 20),
                Text(
                  'للتسجيل يرجى التواصل عن طريق الواتساب على الرقم الاتي :',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () => __launchWhatsapp(),
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          FontAwesomeIcons.whatsapp,
                          size: 50,
                          color: Colors.white,
                        ),
                        Text(
                          '00962798260241',
                          style: getMediumStyle(
                              color: ColorManager.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        )

        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //     children: [
        //       Center(
        //         child: Text(
        //           'التسجيل',
        //           style: getBoldStyle(color: ColorManager.primary, fontSize: 35),
        //         ),
        //       ),
        //       Text(
        //         'للتسجيل يرجى التواصل عن طريق الواتساب على الرقم الاتي :',
        //         style: getMediumStyle(color: ColorManager.black, fontSize: 30),
        //         textDirection: TextDirection.rtl,
        //       ),
        //       Text(
        //         '00962798260241',
        //         style: getMediumStyle(color: ColorManager.primary, fontSize: 30),
        //         textDirection: TextDirection.rtl,
        //       ),
        //       GestureDetector(
        //         onTap: () => __launchWhatsapp(),
        //         child: Container(
        //           margin: EdgeInsets.all(10),
        //           padding: EdgeInsets.all(10),
        //           color: Colors.green,
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //             children: [
        //               Icon(
        //                 FontAwesomeIcons.whatsapp,
        //                 size: 50,
        //               ),
        //               Text(
        //                 'Whatsapp',
        //                 style: getMediumStyle(
        //                     color: ColorManager.black, fontSize: 20),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        );
  }
}
