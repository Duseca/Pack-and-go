import 'package:flutter/material.dart';
import 'package:pack_and_go/view/widgets/two_text_column.dart';

class TripDetails extends StatelessWidget {
  const TripDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
              physics: const BouncingScrollPhysics(),
              children: [
                TwoTextedColumn(
                  text1: 'Location',
                  text2: '4.6',
                  size1: 12,
                  weight1: FontWeight.w400,
                  weight2: FontWeight.bold,
                ),
                SizedBox(
                  height: 10,
                ),
                TwoTextedColumn(
                  text1: 'Destination',
                  text2: 'Heathrow Airport, United Kingdom',
                  size1: 12,
                  weight1: FontWeight.w400,
                  weight2: FontWeight.bold,
                ),
                SizedBox(
                  height: 10,
                ),
                TwoTextedColumn(
                  text1: 'Date and Time',
                  text2: '14 May,2024 - 10:30 am ',
                  size1: 12,
                  weight1: FontWeight.w400,
                  weight2: FontWeight.bold,
                ),
                SizedBox(
                  height: 10,
                ),
                TwoTextedColumn(
                  text1: 'Weight Left',
                  text2: '12 Kg',
                  size1: 12,
                  weight1: FontWeight.w400,
                  weight2: FontWeight.bold,
                ),
                SizedBox(
                  height: 10,
                ),
                TwoTextedColumn(
                  text1: 'Parcel Type',
                  text2: 'Box, Clothes, Gift Box, Laptop',
                  size1: 12,
                  weight1: FontWeight.w400,
                  weight2: FontWeight.bold,
                ),
                SizedBox(
                  height: 120,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
