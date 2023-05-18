import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoppy/utils/app_image.dart';
import 'package:shoppy/view/login/login.dart';
import 'package:shoppy/view/product/product_list.dart';

import '../utils/app_color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashTimer(context);
  }

  void splashTimer(context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString('userToken');
    debugPrint("Token => $token");
    Timer(const Duration(seconds: 3), () {
      token != null || token != ''
          ? Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => ProductList()))
          : Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.DARK_PRIMARY_COLOR,
      body: Center(
        child: Image.asset(AppImage.LOGO),
      ),
    );
  }
}
