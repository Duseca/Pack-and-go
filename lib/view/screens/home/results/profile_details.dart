import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/constants/app_sizes.dart';
import 'package:pack_and_go/constants/app_styling.dart';
import 'package:pack_and_go/view/screens/home/booking/book_traveler.dart';
import 'package:pack_and_go/view/screens/home/results/trip_details.dart';
import 'package:pack_and_go/view/screens/home/results/user_details.dart';
import 'package:pack_and_go/view/widgets/my_button.dart';
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          simpleAppBar2(title: 'Profile Details'),
          Padding(
            padding: AppSizes.DEFAULT,
            child: ProfileTile(),
          ),
          Padding(
            padding: AppSizes.HORIZONTAL,
            child: TabsWidget(
              currentindex: _currentIndex,
              items: _tabs,
              ontap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
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
            onTap: () {
              Get.to(() => BookTraveler());
            },
            buttonText: 'Book Traveler',
            mhoriz: 20,
            mBottom: 20,
          )
        ],
      ),
    );
  }
}
