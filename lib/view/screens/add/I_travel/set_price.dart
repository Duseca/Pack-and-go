import 'package:flutter/material.dart';
import 'package:input_quantity/input_quantity.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/constants/app_fonts.dart';
import 'package:pack_and_go/constants/app_sizes.dart';
import 'package:pack_and_go/constants/app_styling.dart';
import 'package:pack_and_go/view/widgets/input_qty.dart';
import 'package:pack_and_go/view/widgets/my_text_widget.dart';

class SetPrice extends StatelessWidget {
  const SetPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: AppSizes.DEFAULT,
      physics: BouncingScrollPhysics(),
      children: [
        MyText(
          text: 'Set your Price in \$ per kg',
          size: 20,
          weight: FontWeight.w600,
        ),
        InputQuantity()
      ],
    );
  }
}
