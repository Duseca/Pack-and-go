import 'package:flutter/material.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/constants/app_sizes.dart';
import 'package:pack_and_go/constants/app_styling.dart';
import 'package:pack_and_go/generated/assets.dart';
import 'package:pack_and_go/main.dart';
import 'package:pack_and_go/view/screens/home/trip_details.dart';
import 'package:pack_and_go/view/screens/home/user_details.dart';
import 'package:pack_and_go/view/widgets/common_image_view_widget.dart';
import 'package:pack_and_go/view/widgets/icon_text_row.dart';
import 'package:pack_and_go/view/widgets/my_button.dart';
import 'package:pack_and_go/view/widgets/my_text_widget.dart';
import 'package:pack_and_go/view/widgets/profile_tile.dart';
import 'package:pack_and_go/view/widgets/simple_app_bar.dart';
import 'package:pack_and_go/view/widgets/tabs_widget.dart';
import 'package:pack_and_go/view/widgets/two_text_column.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key});

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  int _currentIndex = 0;
  final List<String> _tabs = ['Trips', 'Requests'];

  final List<Widget> tabBarView = [
    TripDetails(),
    UserDetails(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppSizes.DEFAULT,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            simpleAppBar2(title: 'Profile Details'),
            ProfileTile(),
            TabsWidget(
              currentindex: _currentIndex,
              items: _tabs,
              ontap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            Container(
              padding: EdgeInsets.all(7),
              decoration: graddecor(),
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
            ),
            Expanded(
                child: IndexedStack(
              children: tabBarView,
              index: _currentIndex,
            )),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MyButton(
            mhoriz: 20,
            onTap: () {},
            buttonText: 'Chat with Traveler',
            gradient: transparentgrad(),
            fontColor: kSecondaryColor,
            mBottom: 20,
          ),
          MyButton(
            onTap: () {},
            buttonText: 'Book Traveler',
            mhoriz: 20,
            mBottom: 20,
          )
        ],
      ),
    );
  }
}
