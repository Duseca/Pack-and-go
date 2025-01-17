import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/constants/app_styling.dart';
import 'package:pack_and_go/generated/assets.dart';
import 'package:pack_and_go/view/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:pack_and_go/view/widgets/my_button.dart';
import 'package:pack_and_go/view/widgets/my_text_widget.dart';
import 'package:pack_and_go/view/widgets/simple_app_bar.dart';
import 'package:pack_and_go/view/widgets/two_text_column.dart';

class ProfileLanguage extends StatefulWidget {
  const ProfileLanguage({super.key});
  @override
  State<ProfileLanguage> createState() => _ProfileLanguageState();
}

class _ProfileLanguageState extends State<ProfileLanguage> {
  int? isSelected;

  void _updateLocale(int languageValue) {
    switch (languageValue) {
      case 2:
        Get.updateLocale(const Locale('en', 'US'));
        break;
      case 3:
        Get.updateLocale(const Locale('es', 'ES'));
        break;

      default:
        Get.updateLocale(const Locale('en', 'US'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          simpleAppBar2(title: 'Language'),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              physics: const BouncingScrollPhysics(),
              children: [
                TwoTextedColumn(
                  text1: 'Language',
                  text2:
                      'Lorem ipsum dolor sit amet consectetur. Sit porttitor lacus cras neque congue mi viverra justo congue.',
                  size1: 18,
                ),
                language_row(
                  title: 'English',
                  flag: Assets.imagesFlag,
                  isSelected: isSelected == 0,
                  ontap: () {
                    setState(() {
                      isSelected = 0;
                    });
                    _updateLocale(2); // English
                  },
                ),
                SizedBox(height: 18),
                language_row(
                  title: 'Spanish',
                  flag: Assets.imagesFlag,
                  isSelected: isSelected == 1,
                  ontap: () {
                    setState(() {
                      isSelected = 1;
                    });
                    _updateLocale(3); // Spanish
                  },
                ),
                SizedBox(height: 18),
              ],
            ),
          ),
          MyButton(
            mhoriz: 20,
            mBottom: 60,
            buttonText: 'Done',
            onTap: () {
              Get.offAll(() => BottomNavBar());
            },
          ),
        ],
      ),
    );
  }
}

class language_row extends StatefulWidget {
  final String? title, flag;
  final void Function()? ontap;
  final bool? isSelected;
  const language_row({
    super.key,
    this.title,
    this.flag,
    this.ontap,
    this.isSelected,
  });
  @override
  State<language_row> createState() => _language_rowState();
}

class _language_rowState extends State<language_row> {
  @override
  Widget build(BuildContext context) {
    return Bounce(
      duration: Duration(milliseconds: 300),
      onPressed: widget.ontap ?? () {},
      child: Container(
        decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: widget.isSelected == true
                    ? kSecondaryColor
                    : ktransparent)),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 9),
        child: Row(
          children: [
            Expanded(
              child: MyText(
                text: widget.title ?? 'English',
                paddingLeft: 17,
                size: 16,
                color: kSecondaryColor,
              ),
            ),
            AnimatedContainer(
              duration: Duration(
                milliseconds: 230,
              ),
              curve: Curves.easeInOut,
              height: 21,
              width: 21,
              decoration: circle(ktransparent, kGrey2Color),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                margin: EdgeInsets.all(3),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.isSelected == true
                        ? kSecondaryColor
                        : ktransparent,
                    border: Border.all(
                        color: widget.isSelected == true
                            ? kPrimaryColor
                            : kGrey2Color,
                        width: 0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
