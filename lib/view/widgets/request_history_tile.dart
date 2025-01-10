import 'package:flutter/material.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/constants/app_styling.dart';
import 'package:pack_and_go/generated/assets.dart';
import 'package:pack_and_go/view/widgets/icon_text_row.dart';
import 'package:pack_and_go/view/widgets/my_button.dart';
import 'package:pack_and_go/view/widgets/two_text_column.dart';

class RequestHistoryTile extends StatelessWidget {
  const RequestHistoryTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.all(10),
      decoration: rounded2(kPrimaryColor, kPrimaryColor),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: TwoTextedColumn(
                  text1: 'Request Date',
                  weight1: FontWeight.normal,
                  weight2: FontWeight.w600,
                  text2: '14 May,2024 - 10:30 am ',
                  size2: 12,
                  size1: 12,
                ),
              ),
              Expanded(
                child: TwoTextedColumn(
                  text1: 'Weight',
                  text2: '10 Kg',
                  weight1: FontWeight.normal,
                  weight2: FontWeight.w600,
                  size1: 12,
                  size2: 12,
                ),
              ),
              Expanded(
                child: TwoTextedColumn(
                  text1: 'Product Type',
                  text2: 'Gift Box',
                  weight1: FontWeight.normal,
                  weight2: FontWeight.w600,
                  size1: 12,
                  size2: 12,
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                  child: IconTextRow(
                iconpath: Assets.imagesEye,
                text: '150 Impressions',
                iconcolor: kGrey5Color,
                textcolor: kBlack2Color,
              )),
              Expanded(
                  child: IconTextRow(
                iconpath: Assets.imagesInbox,
                text: '12 Responses',
                iconcolor: kGrey5Color,
                textcolor: kBlack2Color,
              ))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: MyButton(
                  onTap: () {},
                  buttonText: 'Withdraw Request',
                  gradient: transparentgrad(),
                  fontColor: kSecondaryColor,
                  radius: 6,
                  height: 30,
                  fontSize: 12,
                ),
              ),
              SizedBox(
                width: 40,
              ),
              Expanded(
                child: MyButton(
                  onTap: () {},
                  buttonText: '    See Details    ',
                  radius: 6,
                  height: 30,
                  fontSize: 12,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
