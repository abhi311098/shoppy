import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shoppy/utils/app_color.dart';
import 'package:shoppy/utils/app_image.dart';
import 'package:shoppy/view%20model/login/login_view_model.dart';
import 'package:shoppy/widgets/circular_loader.dart';
import 'package:shoppy/widgets/text_design.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.DARK_PRIMARY_COLOR,
      body: Consumer<LoginViewModel>(
        builder: (context, provider, child) {
          return Form(
            child: SafeArea(
              child: provider.isLoading
                  ? const CircularLoader()
                  : provider.apiError != null
                      ? Center(
                          child: TextDesign(
                            text: provider.apiError?.response.toString() ?? '',
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            color: AppColor.WHITE_COLOR,
                          ),
                        )
                      : ListView(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 15.h),
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
                              AppImage.LOGO,
                              height: 200.h,
                              width: 200.w,
                              fit: BoxFit.fill,
                              filterQuality: FilterQuality.high,
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            TextFormField(
                              controller: provider.usernameController,
                              cursorColor: AppColor.PRIMARY_COLOR,
                              style: GoogleFonts.poppins(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.WHITE_COLOR),
                              decoration: InputDecoration(
                                hintText: "Email ID",
                                hintStyle: GoogleFonts.poppins(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.WHITE_COLOR),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: AppColor.PRIMARY_COLOR),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: AppColor.PRIMARY_COLOR),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            TextFormField(
                              controller: provider.passwordController,
                              cursorColor: AppColor.PRIMARY_COLOR,
                              style: GoogleFonts.poppins(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.WHITE_COLOR),
                              decoration: InputDecoration(
                                hintText: "Password",
                                hintStyle: GoogleFonts.poppins(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.WHITE_COLOR),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: AppColor.PRIMARY_COLOR),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: AppColor.PRIMARY_COLOR),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  provider.loginApiCall(context);
                                },
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
                            SizedBox(
                              height: 20.h,
                            ),
                            TextDesign(
                              text: "OR",
                              fontSize: 24.sp,
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w600,
                              color: AppColor.WHITE_COLOR,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.WHITE_COLOR,
                                  padding: EdgeInsets.all(15.h),
                                ),
                                child: TextDesign(
                                  text: 'Google',
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w600,
                                )),
                          ],
                        ),
            ),
          );
        },
      ),
    );
  }
}
