import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/generated/assets.dart';
import 'package:pack_and_go/view/screens/auth/forget_password.dart';
import 'package:pack_and_go/view/screens/auth/register.dart';
import 'package:pack_and_go/view/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:pack_and_go/view/widgets/common_image_view_widget.dart';

import 'package:pack_and_go/view/widgets/my_button.dart';
import 'package:pack_and_go/view/widgets/my_text_field.dart';
import 'package:pack_and_go/view/widgets/my_text_widget.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: CommonImageView(
                    imagePath: Assets.imagesLOGO,
                    height: 44,
                  ),
                ),
                MyText(
                  paddingTop: 30,
                  text: 'Log In',
                  weight: FontWeight.bold,
                  size: 18,
                ),
                MyText(
                  text: 'Enter your credential to Log in to your account.',
                  color: ksubtextColor,
                  size: 12,
                  paddingBottom: 40,
                ),
                MyTextField(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CommonImageView(
                      imagePath: Assets.imagesMail,
                      height: 13,
                    ),
                  ),
                  hint: 'Enter your Email',
                  label: 'Username/Email Address',
                ),
                MyTextField(
                  label: 'Password',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CommonImageView(
                      imagePath: Assets.imagesLock,
                      height: 13,
                    ),
                  ),
                  hint: 'Enter your Password',
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CommonImageView(
                      imagePath: Assets.imagesEye,
                      height: 13,
                    ),
                  ),
                ),
                // Row(
                //   children: [
                //     CustomCheckBox(isActive: true, onTap: () {}),
                //     MyText(
                //       text: 'Remember me',
                //       paddingLeft: 10,
                //     )
                //   ],
                // ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyText(text: 'Don’t have an account? '),
                    MyText(
                      text: '  Register',
                      onTap: () {
                        Get.to(() => Register());
                      },
                      color: kSecondaryColor,
                      weight: FontWeight.w600,
                    )
                  ],
                ),
                MyButton(
                  onTap: () {
                    Get.offAll(BottomNavBar());
                  },
                  buttonText: 'Login',
                  mBottom: 20, mTop: 20,
                  // mhoriz: 20,
                ),
                MyText(
                  text: 'Forgot Password?',
                  textAlign: TextAlign.center,
                  onTap: () {
                    Get.to(() => ForgetPassword());
                  },
                  weight: FontWeight.w600,
                  color: kSecondaryColor,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
