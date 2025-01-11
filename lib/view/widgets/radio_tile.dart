import 'package:flutter/material.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/constants/app_styling.dart';
import 'package:pack_and_go/view/widgets/my_text_widget.dart';

class radioTile extends StatefulWidget {
  final int option;
  final String title;
  final bool? isselected;
  final VoidCallback ontap;
  radioTile({
    super.key,
    required this.ontap,
    required this.option,
    this.isselected,
    required this.title,
  });

  @override
  State<radioTile> createState() => _radioTileState();
}

class _radioTileState extends State<radioTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 3),
      child: GestureDetector(
        onTap: widget.ontap,
        child: AnimatedContainer(
          duration: Duration(
            milliseconds: 230,
          ),
          curve: Curves.easeInOut,
          child: Row(
            children: [
              AnimatedContainer(
                duration: Duration(
                  milliseconds: 230,
                ),
                curve: Curves.easeInOut,
                height: 21,
                width: 21,
                decoration: circle(
                    widget.isselected == true
                        ? kSecondaryColor
                        : Colors.transparent,
                    widget.isselected == true ? kBlack2Color : kGrey2Color),
                child: Padding(
                  padding: const EdgeInsets.all(0.5),
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: widget.isselected == true
                                ? kPrimaryColor
                                : Colors.transparent,
                            width: 5)),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: MyText(
                  text: widget.title,
                  color: widget.isselected == true
                      ? kSecondaryColor
                      : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
