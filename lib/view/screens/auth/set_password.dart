import 'package:flutter/material.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/generated/assets.dart';
import 'package:pack_and_go/view/widgets/common_image_view_widget.dart';
import 'package:pack_and_go/view/widgets/my_button.dart';
import 'package:pack_and_go/view/widgets/my_text_field.dart';
import 'package:pack_and_go/view/widgets/my_text_widget.dart';
import 'package:pack_and_go/view/widgets/simple_app_bar.dart';

class SetPassword extends StatelessWidget {
  const SetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: simpleAppBar(
            bgColor: Color(0xfff6f6f6),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  physics: const BouncingScrollPhysics(),
                  children: [
                    MyText(
                      paddingTop: 0,
                      text: 'Set Password',
                      weight: FontWeight.bold,
                      size: 18,
                    ),
                    MyText(
                      text: 'Please set your password to secure your account.',
                      color: ksubtextColor,
                      size: 12,
                      paddingBottom: 20,
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
                    MyTextField(
                      label: 'Repeat Password',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: CommonImageView(
                          imagePath: Assets.imagesLock,
                          height: 13,
                        ),
                      ),
                      marginBottom: 50,
                      hint: 'Enter your Password',
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: CommonImageView(
                          imagePath: Assets.imagesEye,
                          height: 13,
                        ),
                      ),
                    ),
                    MyButton(
                        onTap: () {
                          //   Get.to(() => SetPassword());
                        },
                        buttonText: 'Complete')
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 44.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonImageView(
                imagePath: Assets.imagesLOGO,
                height: 36,
              ),
            ],
          ),
        )
      ],
    );
  }
}
