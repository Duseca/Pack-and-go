import 'package:flutter/material.dart';
import 'package:pack_and_go/view/widgets/simple_app_bar.dart';
import 'package:pack_and_go/view/widgets/two_text_column.dart';

class Language extends StatelessWidget {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          simpleAppBar2(title: 'Language'),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              physics: const BouncingScrollPhysics(),
              children: [
                TwoTextedColumn(
                    text1: 'Language',
                    text2:
                        'Lorem ipsum dolor sit amet consectetur. Sit porttitor lacus cras neque congue mi viverra justo congue.')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
