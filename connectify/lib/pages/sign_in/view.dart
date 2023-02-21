import 'package:chatapp/common/style/color.dart';
import 'package:chatapp/pages/welcome/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dots_indicator/dots_indicator.dart';

import '../../common/values/colors.dart';
import '../../common/values/shadows.dart';
import '../../common/widgets/button.dart';
import 'controller.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            _buildLogo(),
            Spacer(),
            _thirdPartyLogin(),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo(){
    return Container(
      width: 110.w,
      margin: EdgeInsets.only(top: 84.h),
      child: Column(
        children: [
          Container(
            width: 76.w,
            height: 76.w,
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            child: Stack(
              children: [
                Positioned(child: Container(
                  height: 76.w,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryBackground,
                    boxShadow: [
                      Shadows.primaryShadow,
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(35))
                  ),

                )
                ),
                Positioned(child:
                Image.asset(
                    'assets/images/ic_launcher.png',
                width: 76.w,
                height: 76.w,
                fit: BoxFit.cover,
                )
                )
              ],
            ),

          ),
          Container(
            margin: EdgeInsets.only(
              top: 19.h,bottom: 15.h
            ),
            child:
            Text('Let\'s chat',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.thirdElement,
              fontWeight: FontWeight.w600,
              fontSize: 20,
              wordSpacing: 1.5,
              letterSpacing: 1,
              height: 1
            ),
            ),
          )
        ],
      ),
    );
  }
  Widget _thirdPartyLogin(){
    return Container(
      width: 295.w,
      margin: EdgeInsets.only(bottom: 150.h),
      child: Column(
        children: [
          Text("Sign in with other social networks",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.grey[700],
          fontWeight: FontWeight.w400,
          fontSize: 15,
          wordSpacing: 1,
        )
          ),
          Padding(padding: EdgeInsets.only(
            top: 30.w,left: 50.w,right: 50.w
          ),
            child: btnFlatButtonWidget(
              onPressed: (){},
              width: 160.w,
              height: 68.w,
              title: 'Google Login'
            ),

          )

        ],
      ),
    );
  }
}
