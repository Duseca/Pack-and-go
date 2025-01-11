import 'package:flutter/material.dart';
import 'package:pack_and_go/view/widgets/my_text_widget.dart';
import 'package:pack_and_go/view/widgets/two_text_column.dart';

class PublishNow extends StatelessWidget {
  const PublishNow({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      physics: const BouncingScrollPhysics(),
      children: [
        MyText(
          text: 'Enable Instant Booking',
          size: 20,
          paddingBottom: 20,
          weight: FontWeight.w600,
        ),
        TwoTextedColumn(
            text1: 'Allow Convenience',
            text2:
                'No need to review and approve booking requests before it expires'),
        SizedBox(
          height: 10,
        ),
        TwoTextedColumn(
            text1: 'Get more bookings',
            text2: 'Most users prefer to get instant bookings.')
      ],
    );
  }
}
