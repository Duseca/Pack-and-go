import 'package:flutter/material.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/generated/assets.dart';
import 'package:pack_and_go/view/widgets/common_image_view_widget.dart';
import 'package:pack_and_go/view/widgets/my_text_field.dart';
import 'package:pack_and_go/view/widgets/simple_app_bar.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          simpleAppBar2(title: 'Change Password'),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              physics: const BouncingScrollPhysics(),
              children: [
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
                Divider(
                  color: kGrey2Color,
                ),
                MyTextField(
                  label: 'New Password',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CommonImageView(
                      imagePath: Assets.imagesLock,
                      height: 13,
                    ),
                  ),
                  hint: 'Enter your new Password',
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CommonImageView(
                      imagePath: Assets.imagesEye,
                      height: 13,
                    ),
                  ),
                ),
                MyTextField(
                  label: 'Repeat Password',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CommonImageView(
                      imagePath: Assets.imagesLock,
                      height: 13,
                    ),
                  ),
                  hint: 'Repeat your new Password',
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CommonImageView(
                      imagePath: Assets.imagesEye,
                      height: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
