import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoppy/utils/app_color.dart';
import 'package:shoppy/widgets/text_design.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.DARK_PRIMARY_COLOR,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          children: [
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Login",
              style: TextStyle(
                fontSize: 36.sp,
                fontWeight: FontWeight.w600,
                color: AppColor.WHITE_COLOR,
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Image.asset(
              'assets/images/png/logo.png',
              height: 200.h,
              width: 200.w,
              fit: BoxFit.fill,
              filterQuality: FilterQuality.high,
            ),
            SizedBox(
              height: 30.h,
            ),
            TextFormField(
              cursorColor: AppColor.PRIMARY_COLOR,
              style: GoogleFonts.lato(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColor.WHITE_COLOR),
              decoration: InputDecoration(
                hintText: "Email ID",
                hintStyle: GoogleFonts.lato(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.WHITE_COLOR),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColor.PRIMARY_COLOR),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColor.PRIMARY_COLOR),
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            TextFormField(
              cursorColor: AppColor.PRIMARY_COLOR,
              style: GoogleFonts.lato(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColor.WHITE_COLOR),
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: GoogleFonts.lato(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.WHITE_COLOR),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColor.PRIMARY_COLOR),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColor.PRIMARY_COLOR),
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.PRIMARY_COLOR,
                  padding: EdgeInsets.all(15.h),
                ),
                child: TextDesign(
                  text: 'Login',
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColor.WHITE_COLOR,
                )),
          ],
        ),
      ),
    );
  }
}
