import 'package:flutter/material.dart';
import 'package:pack_and_go/constants/app_sizes.dart';
import 'package:pack_and_go/view/widgets/my_text_field.dart';
import 'package:pack_and_go/view/widgets/radio_tile.dart';
import 'package:pack_and_go/view/widgets/two_text_column.dart';

class ParcelType extends StatefulWidget {
  const ParcelType({super.key});

  @override
  State<ParcelType> createState() => _ParcelTypeState();
}

int selectedOption = 1;
List<String> trailer = ['Box Package', 'Files', 'Others (Please specify)'];

class _ParcelTypeState extends State<ParcelType> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: AppSizes.DEFAULT,
      children: [
        TwoTextedColumn(
          text1: 'Specify Parcel Type',
          text2: 'Please specify your parcel to make it easier for traveler.',
          size1: 20,
          weight1: FontWeight.w600,
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: trailer.length,
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return radioTile(
              ontap: () {
                setState(() {
                  selectedOption = index;
                });
              },
              option: index,
              title: trailer[index],
              isselected: selectedOption == index ? true : false,
            );
          },
        ),
        SizedBox(
          height: 20,
        ),
        MyTextField(
          maxLines: 4,
          hint: 'Specify product',
        )
      ],
    );
  }
}
