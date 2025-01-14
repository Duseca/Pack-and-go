import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/generated/assets.dart';
import 'package:pack_and_go/view/widgets/my_button.dart';
import 'package:pack_and_go/view/widgets/my_text_widget.dart';

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
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              physics: const BouncingScrollPhysics(),
              children: [
                Row(
                  children: [
                    MyText(
                      text: 'Choose Your Language',
                      size: 22,
                      weight: FontWeight.w600,
                      color: kSecondaryColor,
                      paddingRight: 8,
                    ),
                  ],
                ),
                MyText(
                  paddingTop: 4,
                  text: 'Please search and then choose your personal language.',
                  size: 16,
                  weight: FontWeight.w400,
                  color: kSecondaryColor,
                  paddingBottom: 15,
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
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}

class language_row extends StatefulWidget {
  final String? title, flag;
  final VoidCallback? ontap;
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
    return GestureDetector(
      onTap: widget.ontap,
      child: Container(
        decoration: BoxDecoration(
            color: widget.isSelected == true ? kSecondaryColor : ktransparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: widget.isSelected == true
                    ? kSecondaryColor.withOpacity(0.2)
                    : ktransparent)),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 9),
        child: Row(
          children: [
            Image.asset(
              widget.flag ?? Assets.imagesFlag,
              width: 28,
              height: 25,
            ),
            Expanded(
              child: MyText(
                text: widget.title ?? 'English',
                paddingLeft: 17,
                size: 16,
                color: kSecondaryColor,
              ),
            ),
            if (widget.isSelected == true)
              Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: Icon(
                  Icons.check,
                  color: kSecondaryColor,
                  size: 18,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
