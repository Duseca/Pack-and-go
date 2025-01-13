import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/constants/app_sizes.dart';
import 'package:pack_and_go/generated/assets.dart';
import 'package:pack_and_go/view/widgets/common_image_view_widget.dart';
import 'package:pack_and_go/view/widgets/my_text_widget.dart';
import 'package:pack_and_go/view/widgets/two_text_column.dart';

class UploadImgss extends StatelessWidget {
  const UploadImgss({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: AppSizes.DEFAULT,
      physics: BouncingScrollPhysics(),
      children: [
        TwoTextedColumn(
          text1: 'Upload images',
          text2: 'Upload at least three photos to make it easier for traveler.',
          size1: 20,
          weight1: FontWeight.w600,
        ),
        UploadTile()
      ],
    );
  }
}

class UploadTile extends StatelessWidget {
  const UploadTile({super.key, this.title, this.height, this.size, this.color});
  final String? title;
  final double? height, size;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(8),
      dashPattern: [3, 3, 3],
      padding: const EdgeInsets.all(0),
      color: kGrey5Color.withOpacity(0.7),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: Container(
          padding: const EdgeInsets.all(0),
          color: kPrimaryColor,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    CommonImageView(
                      imagePath: Assets.imagesCloud,
                      height: height ?? 30,
                    ),
                    MyText(
                      text: title ?? 'Upload Here',
                      color: color ?? kSecondaryColor,
                      size: size ?? null,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
