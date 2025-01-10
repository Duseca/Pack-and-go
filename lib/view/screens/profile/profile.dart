import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/constants/app_styling.dart';
import 'package:pack_and_go/generated/assets.dart';
import 'package:pack_and_go/view/widgets/Icon_title_subtitle.dart';
import 'package:pack_and_go/view/widgets/common_image_view_widget.dart';
import 'package:pack_and_go/view/widgets/my_text_widget.dart';
import 'package:pack_and_go/view/widgets/two_text_column.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                gradient: bggrad(),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                IconTitleSubtitle(
                  iconheight: 80,
                  isurl: true,
                  title: 'John Doe',
                  color1: kPrimaryColor,
                  color2: kPrimaryColor,
                  hasthirdtext: true,
                  size1: 20,
                  subtitle: 'johndoe@gmail.com',
                  subtitle2: '+92300 123 456 7891',
                  trailing: CommonImageView(
                    imagePath: Assets.imagesBadge,
                    height: 50,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(7),
                  decoration:
                      rounded2(kPrimaryColor.withOpacity(0.2), ktransparent),
                  child: Row(
                    children: [
                      Expanded(
                        child: TwoTextedColumn(
                          text1: 'Parcels sent',
                          text2: '05',
                          alignment: ColumnAlignment.center,
                          color1: kPrimaryColor,
                          color2: kPrimaryColor,
                          weight1: FontWeight.w400,
                          weight2: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: TwoTextedColumn(
                          text1: 'Travels',
                          text2: '15',
                          alignment: ColumnAlignment.center,
                          color1: kPrimaryColor,
                          color2: kPrimaryColor,
                          weight1: FontWeight.w400,
                          weight2: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: TwoTextedColumn(
                          text1: 'Ratings',
                          text2: '4.6',
                          alignment: ColumnAlignment.center,
                          color1: kPrimaryColor,
                          color2: kPrimaryColor,
                          weight1: FontWeight.w400,
                          weight2: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              physics: const BouncingScrollPhysics(),
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: rounded(kPrimaryColor),
                  child: Column(
                    children: [buildMenu()],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenu() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.all(0),
          physics: NeverScrollableScrollPhysics(),
          itemCount: menuItems.length,
          separatorBuilder: (context, index) => SizedBox(height: 10),
          itemBuilder: (context, index) {
            final item = menuItems[index];
            return Bounce(
              duration: Duration(milliseconds: 300),
              onPressed: () => item.onTap(),
              child: Animate(
                effects: [
                  MoveEffect(
                      duration: Duration(milliseconds: 200 + (index * 200)))
                ],
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  decoration: BoxDecoration(
                    color: kGrey1Color,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          child: MyText(
                        text: item.title,
                        weight: FontWeight.w600,
                        color: index == menuItems.length - 1 ? kRedColor : null,
                      )),
                      if (index != menuItems.length - 1)
                        CommonImageView(
                          imagePath: Assets.imagesRight,
                          height: 20,
                        )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class MenuItem {
  final String title;
  final VoidCallback onTap;

  MenuItem({
    required this.title,
    required this.onTap,
  });
}

final menuItems = [
  MenuItem(
    title: 'Edit Profile',
    onTap: () {},
  ),
  MenuItem(
    title: 'Language',
    onTap: () {},
  ),
  MenuItem(
    title: 'Change Password',
    onTap: () {},
  ),
  MenuItem(
    title: 'Notifications Settings',
    onTap: () {},
  ),
  MenuItem(
    title: 'Terms and Conditions',
    onTap: () {},
  ),
  MenuItem(
    title: 'Privacy Policy',
    onTap: () {},
  ),
  MenuItem(
    title: 'Log Out',
    onTap: () {},
  ),
];
