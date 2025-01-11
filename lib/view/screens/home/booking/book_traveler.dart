import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/constants/app_styling.dart';
import 'package:pack_and_go/view/screens/home/booking/payment.dart';
import 'package:pack_and_go/view/widgets/custom_drop_down.dart';
import 'package:pack_and_go/view/widgets/custom_row.dart';
import 'package:pack_and_go/view/widgets/my_button.dart';
import 'package:pack_and_go/view/widgets/my_text_field.dart';
import 'package:pack_and_go/view/widgets/my_text_widget.dart';
import 'package:pack_and_go/view/widgets/simple_app_bar.dart';
import 'package:pack_and_go/view/widgets/two_text_column.dart';

class BookTraveler extends StatelessWidget {
  const BookTraveler({super.key});

  @override
  Widget build(BuildContext context) {
    final priceDetails = [
      {'title': 'Price Per KG', 'price': '\$15.50'},
      {'title': 'Total Price', 'price': '\$155.00'},
      {'title': 'App Commission', 'price': '\$1.50'},
      {'title': 'Total', 'price': '\$156.50'},
      {'title': 'Upfront', 'price': '\$15.60'},
      {'title': 'Payment at Delivery', 'price': '\$140.90'},
    ];

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          simpleAppBar2(title: 'Boooking'),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              physics: const BouncingScrollPhysics(),
              children: [
                TwoTextedColumn(
                  text1: 'Select Weight & Product Type',
                  text2:
                      'Select proper weight, Price will change per product type and weight.',
                  size1: 16,
                  weight1: FontWeight.w600,
                ),
                MyTextField(
                  label: 'Weight',
                  hint: 'Enter Weight',
                  suffixIcon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [MyText(text: 'kg')],
                  ),
                ),
                CustomDropDown(
                    label: 'Product Type',
                    hint: 'Select Product Type',
                    items: ['Select Product Type'],
                    selectedValue: 'Select Product Type',
                    onChanged: (v) {}),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: rounded2(kPrimaryColor, kPrimaryColor),
                  child: Column(
                    children: [
                      for (int i = 0; i < priceDetails.length; i++)
                        CustomRow(
                            colorLeft: kBlackColor,
                            sizeleft: 14,
                            sizeright: 16,
                            weightright: FontWeight.bold,
                            weightleft: FontWeight.normal,
                            left: priceDetails[i]['title']!,
                            right: priceDetails[i]['price']!)
                    ],
                  ),
                )
              ],
            ),
          ),
          MyButton(
            onTap: () {
              Get.to(() => Payment());
            },
            buttonText: 'Pay \$14.5',
            mhoriz: 20,
            mBottom: 30,
          )
        ],
      ),
    );
  }
}
