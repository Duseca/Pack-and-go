import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pack_and_go/generated/assets.dart';
import 'package:pack_and_go/view/screens/home/booking/credit_card_pay.dart';
import 'package:pack_and_go/view/widgets/my_button.dart';
import 'package:pack_and_go/view/widgets/payment_tile.dart';
import 'package:pack_and_go/view/widgets/simple_app_bar.dart';
import 'package:pack_and_go/view/widgets/two_text_column.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

List<dynamic> items = [
  {'path': Assets.imagesCredit, 'title': 'Credit Card'},
  {'path': Assets.imagesMtn, 'title': 'MTN Mobile Money'},
  {'path': Assets.imagesMoov, 'title': 'Moov Money'},
  {'path': Assets.imagesCeltiis, 'title': 'Celtiis Money'}
];
int selectedOption = -1;

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          simpleAppBar2(),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              physics: const BouncingScrollPhysics(),
              children: [
                TwoTextedColumn(
                  text1: 'Select Payment Method',
                  text2:
                      'Select your payment method and confirm your bookings.',
                  size1: 16,
                  weight1: FontWeight.w600,
                ),
                SizedBox(
                  height: 10,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: items.length,
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return PaymentTile(
                      duration: Duration(milliseconds: 300 + (index * 200)),
                      path: items[index]['path'],
                      ontap: () {
                        setState(() {
                          selectedOption = index;
                        });
                      },
                      option: index,
                      title: items[index]['title'],
                      isselected: selectedOption == index ? true : false,
                    );
                  },
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          MyButton(
            onTap: () {
              Get.to(() => CreditCardPay());
            },
            buttonText: 'Next',
            mhoriz: 20,
            mBottom: 30,
          )
        ],
      ),
    );
  }
}
