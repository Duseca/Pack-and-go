import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/constants/app_styling.dart';
import 'package:pack_and_go/view/widgets/my_text_widget.dart';

class CustomAccordion extends StatefulWidget {
  const CustomAccordion({
    Key? key,
    this.children,
  }) : super(key: key);
  final List<Widget>? children;
  @override
  State<CustomAccordion> createState() => _CustomAccordionState();
}

class _CustomAccordionState extends State<CustomAccordion> {
  bool _isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          dividerColor: Colors.transparent,
          splashColor: Colors.transparent,
          shadowColor: Colors.transparent),
      child: Animate(
        effects: [
          MoveEffect(
              begin: Offset(100, 0), duration: Duration(milliseconds: 300))
        ],
        child: Container(
          decoration: rounded2(kPrimaryColor, kPrimaryColor),
          padding: EdgeInsets.all(8),
          child: ExpansionTile(
            tilePadding: EdgeInsets.all(0),
            minTileHeight: 20,
            childrenPadding: EdgeInsets.all(0),
            iconColor: kBlack2Color,

            //collapsedBackgroundColor: Color(0xff1b1b1b),
            title: MyText(
              text: "Payment Details",
              size: 14,
              weight: _isOpen ? FontWeight.w500 : FontWeight.w400,
            ),
            //backgroundColor: kGrey1Color.withOpacity(0.5),
            children: widget.children ??
                <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                            contentPadding: EdgeInsets.all(0),
                            title: MyText(
                              text:
                                  'Non dapibus ex. Mauris vel velit eget odio volutpat ultricies nec vitae enim. Duis tempus orci odio, in feugiat massa tristique ut. Nunc turpis nunc, hendrerit ac sem in, fermentum rhoncus lacus. Morbi consequat nulla ipsum, non lobortis lorem laoreet eget.',
                              size: 12,
                              weight: FontWeight.w500,
                              color: kGrey5Color,
                            )),
                      ],
                    ),
                  ),
                ],
            onExpansionChanged: (bool expanded) {
              setState(() {
                _isOpen = expanded;
              });
            },
          ),
        ),
      ),
    );
  }
}
