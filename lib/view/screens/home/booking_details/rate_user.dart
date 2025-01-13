import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/view/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:pack_and_go/view/widgets/my_button.dart';
import 'package:pack_and_go/view/widgets/my_ratings.dart';
import 'package:pack_and_go/view/widgets/my_text_field.dart';
import 'package:pack_and_go/view/widgets/profile_tile.dart';
import 'package:pack_and_go/view/widgets/simple_app_bar.dart';

class RateUser extends StatelessWidget {
  const RateUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          simpleAppBar2(title: 'Rate User'),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              physics: const BouncingScrollPhysics(),
              children: [
                ProfileTile(),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: StarRating(
                    rating: 0,
                    size: 60,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                MyTextField(
                  label: 'Write Review',
                  maxLines: 10,
                  labelColor: kBlack2Color,
                  labelWeight: FontWeight.bold,
                  marginBottom: 40,
                ),
                MyButton(
                    onTap: () {
                      Get.offAll(() => BottomNavBar());
                    },
                    buttonText: 'Submit Rating')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
