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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            
            Center(
              child: Text(
                'التسجيل',
                style: getBoldStyle(color: ColorManager.primary, fontSize: 35),
              ),
            ),
            Text(
              'للتسجيل يرجى التواصل عن طريق الواتساب على الرقم الاتي :',
              style: getMediumStyle(color: ColorManager.black, fontSize: 30),
              textDirection: TextDirection.rtl,
            ),
            Text(
              '00962798260241',
              style: getMediumStyle(color: ColorManager.primary, fontSize: 30),
              textDirection: TextDirection.rtl,
            ),
            GestureDetector(
              onTap: () => __launchWhatsapp(),
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                color: Colors.green,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      FontAwesomeIcons.whatsapp,
                      size: 50,
                    ),
                    Text(
                      'Whatsapp',
                      style: getMediumStyle(
                          color: ColorManager.black, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          
          ],
        ),
      ),
    );
  }
}
