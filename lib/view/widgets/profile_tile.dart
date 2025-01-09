import 'package:flutter/material.dart';
import 'package:pack_and_go/generated/assets.dart';
import 'package:pack_and_go/main.dart';
import 'package:pack_and_go/view/widgets/common_image_view_widget.dart';
import 'package:pack_and_go/view/widgets/icon_text_row.dart';
import 'package:pack_and_go/view/widgets/my_text_widget.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CommonImageView(
          url: dummyImage,
          radius: 200,
          height: 60,
          width: 60,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: 'Wesley',
                weight: FontWeight.w600,
              ),
              IconTextRow(
                iconpath: Assets.imagesStar,
                text: ' 4.8',
              ),
            ],
          ),
        ),
        CommonImageView(
          imagePath: Assets.imagesBadge,
          height: 50,
        )
      ],
    );
  }
}
