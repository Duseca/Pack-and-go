import 'package:flutter/material.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/constants/app_styling.dart';
import 'package:pack_and_go/view/widgets/Icon_title_subtitle.dart';
import 'package:pack_and_go/view/widgets/my_ratings.dart';
import 'package:pack_and_go/view/widgets/my_text_widget.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({super.key});

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
                Container(
                  decoration: rounded(kPrimaryColor),
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      IconTitleSubtitle(
                        isurl: true,
                        iconheight: 28,
                        title: 'Maria Will',
                        subtitle: '1 month ago',
                        size1: 12,
                        size2: 10,
                        trailing: RatingText(),
                      ),
                      MyText(
                          paddingTop: 5,
                          size: 12,
                          text:
                              'This guy was super awesome, responded very quickly, he took care of my stuff and delivered it in a very good condition.'),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
