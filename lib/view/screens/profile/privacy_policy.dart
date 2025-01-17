import 'package:flutter/material.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/constants/app_fonts.dart';
import 'package:pack_and_go/view/widgets/my_text_widget.dart';
import 'package:pack_and_go/view/widgets/simple_app_bar.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          simpleAppBar2(title: 'Privacy Policy'),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              physics: const BouncingScrollPhysics(),
              children: [
                MyText(
                  text: 'Pack & Go’s Privacy policy',
                  weight: FontWeight.w400,
                  //   color: ksubtextColor,
                  paddingBottom: 5,
                ),
                MyText(
                  text: 'Last Updated: 12 Nov 2023',
                  paddingBottom: 20,
                  // color: kTertiaryColor,
                ),
                MyText(
                  paddingBottom: 10,
                  text:
                      'Welcome to Marchè Social! This Privacy Policy outlines how we collect, use, disclose, and protect your information when you use our mobile application. By using Marchè Social, you agree to the terms described in this policy.',
                  color: kGrey5Color,
                ),
                MyText(
                  text: '1. Information We Collect:',
                  weight: FontWeight.w400,
                  color: ksubtextColor,
                ),
                MyText(
                  text: 'We may collect the following types of information::',
                  paddingTop: 20,
                  weight: FontWeight.w400,
                  color: kTertiaryColor,
                  paddingBottom: 20,
                ),
                richtext('Account Information:',
                    ' When you create an account, we collect your username, email address, and profile information.'),
                richtext('Content:',
                    ' We may collect and store the content you create, share, or receive on Marchè Social, such as posts, comments, and messages.'),
                richtext('Device Information:',
                    'We collect information about the device you use to access Marchè Social, including device type, operating system, and unique device identifiers.'),
                richtext('Usage Information:',
                    ' We collect data about your interactions with the app, including the features you use, the content you view, and your interactions with other users.'),
                MyText(
                  text: '2. How We Use Your Information:',
                  weight: FontWeight.w400,
                  color: ksubtextColor,
                ),
                MyText(
                  text:
                      'We use the collected information for the following purposes:',
                  paddingTop: 20,
                  weight: FontWeight.w400,
                  color: kTertiaryColor,
                  paddingBottom: 20,
                ),
                richtext('Providing Services: ',
                    ' To provide and improve our services, personalize your experience, and facilitate connections with other users.'),
                richtext('Analytics:',
                    ' Legal Compliance:** To comply with legal requirements and protect our rights.'),
                MyText(
                  paddingBottom: 10,
                  text:
                      'We value your privacy. Check out our Privacy Policy to understand how we collect, use, and protect your personal information.',
                  color: kTertiaryColor,
                ),
                MyText(
                  weight: FontWeight.w400,
                  color: ksubtextColor,
                  paddingBottom: 5,
                  text: "3. Information Sharing:",
                ),
                MyText(
                  text:
                      'We do not sell your personal information to third parties. However, we may share information with trusted service providers to help us operate the app and provide support services.',
                  color: kTertiaryColor,
                ),
                MyText(
                  text: '4. Public Information:',
                  weight: FontWeight.w400,
                  color: ksubtextColor,
                  paddingBottom: 5,
                ),
                MyText(
                  text:
                      'Some of the information you provide on Partnr Social may be visible to other users, depending on your privacy settings. Be mindful of the information you choose to share publicly.',
                  color: kTertiaryColor,
                  paddingBottom: 10,
                ),
                MyText(
                  text:
                      'We reserve the right to terminate accounts violating our terms without notice.',
                  color: kTertiaryColor,
                ),
                MyText(
                  text: '5. Security:',
                  weight: FontWeight.w400,
                  color: ksubtextColor,
                  paddingBottom: 5,
                ),
                MyText(
                  text:
                      "Terms may be updated; it's your responsibility to stay informed.",
                  color: kTertiaryColor,
                  paddingBottom: 20,
                ),
                MyText(
                  text:
                      "Thanks for being part of Marchè – let's create an amazing social experience together!",
                  color: kTertiaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget richtext(String title, subtitle) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: title,
          style: TextStyle(
            fontFamily: AppFonts.URBANIST,
            fontWeight: FontWeight.w400,
            color: kSecondaryColor,
          )),
      TextSpan(
          text: subtitle,
          style: TextStyle(
              fontFamily: AppFonts.URBANIST,
              fontWeight: FontWeight.w400,
              color: kTertiaryColor))
    ]));
  }
}
