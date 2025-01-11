import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/constants/app_styling.dart';
import 'package:pack_and_go/generated/assets.dart';
import 'package:pack_and_go/view/screens/add/I_travel/publish_trip.dart';
import 'package:pack_and_go/view/screens/add/i_send_package/punlish_packagel.dart';
import 'package:pack_and_go/view/widgets/custom_animated_row.dart';
import 'package:pack_and_go/view/widgets/my_button.dart';
import 'package:pack_and_go/view/widgets/my_text_widget.dart';
import 'package:pack_and_go/view/widgets/simple_app_bar.dart';

class Publish extends StatefulWidget {
  const Publish({super.key});

  @override
  State<Publish> createState() => _PublishState();
}

int selectedIndex = -1;

class _PublishState extends State<Publish> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          simpleAppBar2(),
          Spacer(),
          AnimatedRow(
            children: [
              SizedBox(
                width: 10,
              ),
              for (int i = 0; i < 2; i++)
                Expanded(
                  child: Bounce(
                    duration: Duration(milliseconds: 100),
                    onPressed: () {
                      setState(() {
                        selectedIndex = i;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: rounded2(
                        selectedIndex == i ? kSecondaryColor : kPrimaryColor,
                        selectedIndex == i ? kSecondaryColor : kPrimaryColor,
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            color: selectedIndex == i
                                ? kPrimaryColor
                                : kBlack2Color,
                            i == 1 ? Assets.imagesPackege : Assets.imagesTravel,
                            height: 50,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          MyText(
                            text: i == 1 ? 'I send Package' : 'I Travel',
                            size: 16,
                            color: selectedIndex == i
                                ? kPrimaryColor
                                : kBlack2Color,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          Spacer(),
          MyButton(
            onTap: () {
              if (selectedIndex == 0) {
                Get.to(() => PublishTrip());
              } else if (selectedIndex == 1) {
                Get.to(() => PublishPackage());
              } else {
                Get.snackbar('Error', 'Please Select First');
              }
            },
            buttonText: 'Next',
            mhoriz: 20,
          ),
          Spacer()
        ],
      ),
    );
  }
}
